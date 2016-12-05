function Set-IOPSLimit {
<#	
    .NOTES
    ===========================================================================
    Created by: Markus Kraus
    Twitter: @VMarkus_K
    Private Blog: mycloudrevolution.com
    ===========================================================================
    Changelog:  
    2016.11 ver 2.0 Base Release 
    ===========================================================================
    External Code Sources:  
    http://www.lucd.info/2011/04/22/get-the-maximum-iops/
    https://communities.vmware.com/thread/485386
    ===========================================================================
    Tested Against Environment:
    vSphere Version: 5.5 U2
    PowerCLI Version: PowerCLI 6.3 R1, PowerCLI 6.5 R1
    PowerShell Version: 4.0, 5.0
    OS Version: Windows 8.1, Server 2012 R2
    Keyword: VM, IOPS, Limits
    ===========================================================================

    .DESCRIPTION
    Report and Set VM Disk IO Limits 

    .Example
    Get-VM -Name TST* | Set-IOPSLimit -ConfigPath C:\Scripts\vSphere-Modules\Set-IOPSLimit.xml -SetLimit | ft -AutoSize

    .Example
    Get-VM -Name TST* | Set-IOPSLimit -ConfigPath C:\Scripts\vSphere-Modules\Set-IOPSLimit.xml | ft -AutoSize

    .PARAMETER VMs
    Specify the VMs 

    .PARAMETER ConfigPath
    Path to XML File with Valid Configuration

    Example:
    <?xml version="1.0" encoding="utf-8"?>
    <Config version="1.0">
    <Variable Name="Split" Value="-" />
    <Variable Name="Split_Position" Value="3" />
    <Bronze>
      <Name>B</Name>
      <Value>250</Value>
    </Bronze>
    <Silver>
      <Name>S</Name>
      <Value>1000</Value>
    </Silver>
    <Gold>
      <Name>G</Name>
      <Value>-1</Value>
    </Gold>
    </Config>

    .PARAMETER SetLimit
    Switch to enforce the Limits

#Requires PS -Version 4.0
#Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
#>

[CmdletBinding()]
param( 
    [Parameter(Mandatory=$True, ValueFromPipeline=$True, Position=0)]
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.InventoryItemImpl[]] $VMs,
    [Parameter(Mandatory=$True, ValueFromPipeline=$False, Position=1)]
        [String] $ConfigPath,
    [Parameter(Mandatory=$False, ValueFromPipeline=$False, Position=2)]
        [String] $Exclusions = "Template_*|Test_*",
    [Parameter(Mandatory=$False, ValueFromPipeline=$False, Position=3)]
        [Switch] $SetLimit
        
)
Begin {
    $Validate = $True 
    $XMLValidate = $True 
    #region: Read XML
    If (Test-Path $ConfigPath) {
            try {
                $Variable = [XML] (Get-Content $ConfigPath)
            } 
            catch {
                Write-Error "Invalid xml"; $XMLValidate = $False
            }
        } 
    Else {
            Write-Error "Missing xml File"; $XMLValidate = $False
    }
    #endregion

    #region: Process XML Values
    [String] $B = $Variable.Config.Bronze.Name
    [Int] $B_Limit = $Variable.Config.Bronze.Value
    [String] $S = $Variable.Config.Silver.Name
    [Int] $S_Limit = $Variable.Config.Silver.Value
    [String] $G = $Variable.Config.Gold.Name
    [Int] $G_Limit = $Variable.Config.Gold.Value
    [String] $Split = ($Variable.Config.Variable | Where-Object {$_.Name -eq "Split"}).Value
    [Int] $Split_position = ($Variable.Config.Variable | Where-Object {$_.Name -eq "Split_Position"}).Value
    #endregion
}

Process {
    if ($XMLValidate -eq $True) {
        $Validate = $True     
        #region: Filter VMs
        $myVMs = $VMs | where {($_ | Get-HardDisk).count -gt 0 -and ($_ | Get-HardDisk).ExtensionData.Controllerkey -ne 200}
        #endregion

        if ($null -ne $myVMs) {
            #region: Creating HD-Tab
            Write-Verbose "Starting to Create HD-Tab..."
            $hdTab = @{}
            foreach($hd in (Get-Harddisk -VM $myVMs)){
                $controllerKey = $hd.Extensiondata.ControllerKey
                $controller = $hd.Parent.Extensiondata.Config.Hardware.Device | where{$_.Key -eq $controllerKey}
                $hdTab[$hd.Parent.Name + "/scsi" + $controller.BusNumber + ":" + $hd.Extensiondata.UnitNumber] = $hd.FileName.Split(']')[0].TrimStart('[')
            }
            #endregion

            #region: Creating and Process VM Rport
            Write-Verbose "Starting to Process VM Report..."
            $report = @()
            foreach ($myVM in $myVMs) {
                $VMHDDs = Get-HardDisk -VM $myVMs | select Name, ExtensionData, Filename, CapacityKB
                foreach ($VMHDD in $VMHDDs) {
                    $row = "" | select VmName, ScsiID, Datastore, Tier, CapacityGB, CurrentIOLimit, PlannedIOLimit, IOLimitCorrect, HostSchedulerIsmClock, Processed
                    $row.VmName = $myVM.Name
                    $row.ScsiID = $([string]$VmHdd.extensiondata.controllerkey).substring(3,1) +":"+ $([string]$VmHdd.extensiondata.unitnumber)
                    $row.Datastore = $($VmHdd.Filename.TrimStart("[")).split("]")[0]  
                    $row.Tier = $row.Datastore.Split($Split)[$Split_position]  
                    switch ($row.Tier) {
                        $S {$row.PlannedIOLimit = $S_Limit}
                        $B {$row.PlannedIOLimit = $B_Limit}
                        $G {$row.PlannedIOLimit = $G_Limit}
                        default {Write-Error "Invalid DS name or tier identifier" ; $Validate = $False}
                    }
                    if ($row.VmName -match $Exclusions) {$row.PlannedIOLimit = -1}
                    elseif ($VmHdd.ExtensionData.Backing.DiskMode -eq "independent_persistent") {$row.PlannedIOLimit = -1}
                    $row.CapacityGB = [Math]::round(($VmHdd.capacitykb / 1024 / 1024),2)
                    $row.CurrentIOlimit = $VmHdd.ExtensionData.StorageIOAllocation.limit
                    if ($row.CurrentIOLimit -eq -1 -and $row.PlannedIOLimit -ne -1 -and $row.VmName -notmatch $Exclusions) {$row.IOLimitCorrect = "No IO Limit Set"}
                    elseif ($row.VmName -match $Exclusions) {$row.IOLimitCorrect = "Fixed Unlimited"}
                    elseif ($VmHdd.ExtensionData.Backing.DiskMode -eq "independent_persistent") {$row.IOLimitCorrect = "Fixed Unlimited"}
                    elseif ($row.CurrentIOLimit -gt $row.PlannedIOLimit) {$row.IOLimitCorrect = "Too High"}
                    elseif ($row.CurrentIOLimit -lt $row.PlannedIOLimit) {$row.IOLimitCorrect = "Too Low"}
                    else {$row.IOLimitCorrect = "Just Right"}
                    $SchedulerWithReservation = (Get-AdvancedSetting -Entity $myVM.VMHost -Name Disk.SchedulerWithReservation).Value
                    if ($SchedulerWithReservation -eq 0){ $row.HostSchedulerIsmClock = "False" }
                    else{ $row.HostSchedulerIsmClock = "True" }
                    $row.Processed = "False"
                    if ($SetLimit -and $Validate -eq $True) {
                        if ($row.IOLimitCorrect -ne "Just Right") {
                        $VMDisk = $myVM | Get-HardDisk | where {$_.Name -eq $VmHdd.Name}
                        if ($myVM.Name -match $Exclusions) {                            ## Remove Limit on Exclusions
                            if ($VMDisk.ExtensionData.StorageIOAllocation.limit -ne -1) {
                                $myVM | Get-VMResourceConfiguration | Set-VMResourceConfiguration -Disk $VMDisk -DiskLimitIOPerSecond "-1" | Out-Null
                                $row.Processed = "True"
                                }
                            }
                        elseif ($VMDisk.Persistence -eq "independentpersistent" ) {     ## Remove Limit on Raw Devices
                            if ($VMDisk.ExtensionData.StorageIOAllocation.limit -ne -1) {
                                $myVM | Get-VMResourceConfiguration | Set-VMResourceConfiguration -Disk $VMDisk -DiskLimitIOPerSecond "-1" | Out-Null
                                $row.Processed = "True"
                                }

                            }
                            else {                                                      ## Set Limit
                                $myVM | Get-VMResourceConfiguration | Set-VMResourceConfiguration -Disk $VMDisk -DiskLimitIOPerSecond $row.PlannedIOLimit | Out-Null
                                $row.Processed = "True"
                                if( $row.HostSchedulerIsmClock -eq "True" ){ Write-Warning "mClock Scheduler can couse unexpected Results!`nSee: http://anthonyspiteri.net/esxi-5-5-iops-limit-mclock-scheduler/" }
                                }
                            } 
                        }
                    $report += $row
                    }
                }
            #endregion
            if ($SetLimit -and $Validate -eq $False) {Write-Output "`n"; Write-Error "Validation Failed! VM Disk Processing Skipped"}
            $Report 
            }
        }
        Else {
            Write-Error "XML Validation Failed! Processing Skipped"
        }
    }

    End {
        ## No End
    }

}