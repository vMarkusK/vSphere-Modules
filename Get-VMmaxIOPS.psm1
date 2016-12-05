function Get-VMmaxIOPS {
<#	
    .NOTES
    ===========================================================================
    Created by: Markus Kraus
    Twitter: @VMarkus_K
    Private Blog: mycloudrevolution.com
    ===========================================================================
    Changelog:  
    2016.08 ver 1.0 Base Release 
    2016.11 ver 1.1 New Counters
    ===========================================================================
    External Code Sources:  
    http://www.lucd.info/2011/04/22/get-the-maximum-iops/
    https://communities.vmware.com/thread/485386
    ===========================================================================
    Tested Against Environment:
    vSphere Version: 5.5 U2, 6.5
    PowerCLI Version: PowerCLI 6.3 R1, PowerCLI 6.5 R1
    PowerShell Version: 4.0, 5.0
    OS Version: Windows 8.1, Server 2012 R2
    ===========================================================================
    Keywords vSphere, ESXi, VM, Storage, Sizing
    ===========================================================================

    .DESCRIPTION
    This Function will Create a VM Disk IOPS Report

    .Example
    Get-Folder -Name TST | Get-VM | where {$_.PowerState -eq "PoweredOn"} | Get-VMmaxIOPS -Minutes 120 | ft -AutoSize  

    .Example
    Get-Cluster -Name TST | Get-VM | where {$_.PowerState -eq "PoweredOn"} | Get-VMmaxIOPS

    .Example
    Get-VM -Name TST*| where {$_.PowerState -eq "PoweredOn"} | Get-VMmaxIOPS -Minutes 120 | ft -AutoSize  

    .PARAMETER VMs
    Specify the VMs 

    .PARAMETER Minutes
    Time Range in Minutes for the Stats Collection.
    Default is 30 Minutes.

#Requires PS -Version 4.0
#Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
#>

[CmdletBinding()]
param( 
    [Parameter(Mandatory=$true, ValueFromPipeline=$True, Position=0)]
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.InventoryItemImpl[]]
        $VMs,
    [Parameter(Mandatory=$false, Position=1)]
        [int] $Minutes = 30
)

Process { 
    if ($_.PowerState -eq "PoweredOn") {
        #region: Global Definitions
        [int]$TimeRange = "-" + $Minutes
        #endregion

        #region: Creating VM Stats
        $VMMetrics = "virtualDisk.numberReadAveraged.average","virtualDisk.numberWriteAveraged.average"
        $Start = (Get-Date).AddMinutes($TimeRange)
        $VMStats = Get-Stat -Realtime -Stat $VMMetrics -Entity $VMs -Start $Start -Verbose:$False
        #endregion

        #region: Creating HD-Tab
        $hdTab = @{}
        foreach($hd in (Get-Harddisk -VM $VMs)){
            $controllerKey = $hd.Extensiondata.ControllerKey
            $controller = $hd.Parent.Extensiondata.Config.Hardware.Device | where{$_.Key -eq $controllerKey}
            $hdTab[$hd.Parent.Name + "/scsi" + $controller.BusNumber + ":" + $hd.Extensiondata.UnitNumber] = $hd.FileName.Split(']')[0].TrimStart('[')
        }
        #endregion
        
        #region: Creating Reports
        $reportPerf = @() 
        $reportPerf = $VMStats | Group-Object -Property {$_.Entity.Name},Instance | %{
            New-Object PSObject -Property @{
                VM = $_.Values[0]
                Disk = $_.Values[1]
                IOPSWriteAvg = [math]::round( ($_.Group | `
                    where{$_.MetricId -eq "virtualDisk.numberWriteAveraged.average"} | `
                    Measure-Object -Property Value -Maximum).Maximum ,2)
                IOPSReadAvg = [math]::round( ($_.Group | `
                    where{$_.MetricId -eq "virtualDisk.numberReadAveraged.average"} | `
                    Measure-Object -Property Value -Maximum).Maximum ,2)
                Datastore = $hdTab[$_.Values[0] + "/"+ $_.Values[1]]
            }
        }
    }
    Else {
        Write-Error "VM $($_.Name) is Powered Off! IOPS Processing Skipped"
    }
    $reportPerf | Select-Object VM, Disk, Datastore, IOPSWriteAvg, IOPSReadAvg
    #endregion
    }
}