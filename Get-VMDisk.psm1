function Get-VMDisk {
    <#	
        .NOTES
        ===========================================================================
        Created by: Markus Kraus
        Twitter: @VMarkus_K
        Private Blog: mycloudrevolution.com
        ===========================================================================
        Changelog:  
        2016.09 ver 1.0 Base Release 
        2016.11 ver 1.1 VM pipe
        2020.02 ver 1.2 Add SCSI ID
        ===========================================================================
        External Code Sources:  
        http://www.lucd.info/2011/04/22/get-the-maximum-iops/
        ===========================================================================
        Tested Against Environment:
        vSphere Version: 6.7 U3
        PowerCLI Version: PowerCLI 11.5
        PowerShell Version: 5.1, 6.1
        OS Version: Windows 2016, Windows 10
        ===========================================================================
        Keywords vSphere, ESXi, VM, vDisk
        ===========================================================================
    
        .Description
        This Function reports VM vDisks and Datastores:
    
        Get-VM MyTest | Get-VMDisk | Format-Table -AutoSize
    
        Name   PowerState Datastore Path                  Disk        StorageFormat CapacityGB Controller Unit
        ----   ---------- --------- ----                  ----        ------------- ---------- ---------- ----
        MyTest PoweredOff data01     MyTest/MyTest.vmdk   Hard disk 1          Thin         16          0    0
        MyTest PoweredOff data02     MyTest/MyTest_1.vmdk Hard disk 2          Thin         20          1    0
        MyTest PoweredOff data01     MyTest/MyTest_2.vmdk Hard disk 3         Thick         20          1    1
        
        .Example
        Get-VM -Name TST* | Get-VMDisk
    
        .Example
        Get-Folder -Name TST | Get-VM | Get-VMDisk | ft -AutoSize
    
    #Requires PS -Version 5.0
    #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
    #>
    
    [CmdletBinding()]
        param( 
            [Parameter(Mandatory=$True, ValueFromPipeline=$True, Position=0, HelpMessage = "VMs to process")]
            [ValidateNotNullorEmpty()]
                [VMware.VimAutomation.ViCore.Impl.V1.Inventory.InventoryItemImpl[]] $myVMs
        )
    Process {
            $View = @()
            foreach ($myVM in $myVMs){
                $VMDKs = $myVM | get-HardDisk
                foreach ($VMDK in $VMDKs) {
                    if ($VMDK -ne $null){
                        [int]$CapacityGB = $VMDK.CapacityKB/1024/1024
                        $Report = [PSCustomObject] @{
                                Name = $myVM.name 
                                PowerState = $myVM.PowerState
                                Datastore = $VMDK.FileName.Split(']')[0].TrimStart('[')
                                Path = $VMDK.FileName.Split(']')[1].TrimStart('[')
                                Disk = $VMDK.Name
                                StorageFormat = $VMDK.StorageFormat
                                CapacityGB = $CapacityGB
                                Controller = $VMDK.ExtensionData.ControllerKey -1000
                                Unit = $VMDK.ExtensionData.UnitNumber
                            }
                            $View += $Report
                        }   
                    }
                }
        $View | Sort-Object VMname, Controller, Unit
        }
    }
    