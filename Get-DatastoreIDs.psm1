function Get-DatastoreIDs {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True, ValueFromPipeline=$True, HelpMessage="ESXi Host")]
        [ValidateNotNullorEmpty()]
            [VMware.VimAutomation.ViCore.Impl.V1.Inventory.InventoryItemImpl] $VmHosts

    )

    begin{
        $MyView = @() 
    }
    
    process {
            
            foreach ($VmHost in $VmHosts) {
                
                $Ds_View = Get-View (Get-View $Vmhost.ID).ConfigManager.StorageSystem

                foreach ($Volume in $Ds_View.FileSystemVolumeInfo.MountInfo) {

                    if ($Volume.Volume.Type -eq "VMFS") {
                        $Report = [PSCustomObject] @{
                            HostName = $VmHost.Name
                            VolName = $Volume.Volume.Name
                            VolUUID = $Volume.Volume.Uuid
                            DiskName = $Volume.Volume.Extent.DiskName
                            }
        
                        $MyView += $Report
                    }

                }
            }
    }

    end{
        $MyView   
    }
    
}