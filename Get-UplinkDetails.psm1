function Get-UplinkDetails {
<#	
    .NOTES
    ===========================================================================
    Created by: Markus Kraus
    Twitter: @VMarkus_K
    Private Blog: mycloudrevolution.com
    ===========================================================================
    Changelog:  
    2017.03 ver 1.0 Base Release  
    ===========================================================================
    External Code Sources: 
    Get-CDP Version from @LucD22
    https://communities.vmware.com/thread/319553
    ===========================================================================
    Tested Against Environment:
    vSphere Version: vSphere 6.0 U2
    PowerCLI Version: PowerCLI 6.3 R1
    PowerShell Version: 4.0
    OS Version: Server 2012 R2
    Keyword: ESXi, Network, CDP, DVS, vSwitch, VMNIC 
    ===========================================================================

    .DESCRIPTION
    This Function collects detailed informations about your ESXi Host connections to pSwitch and DVS / vSwitch

    .Example
    Get-UplinkDetails -Clustername * | ft -AutoSize

    .Example
    Get-UplinkDetails -Clustername MyCluster001 | ft -AutoSize

    .Example
    Get-UplinkDetails -Clustername MyCluster* | Sort Clustername, Hostname, DVS | ft -AutoSize

    .PARAMETER Clustername
    Your vSphere Cluster Name or Wildcard


#Requires PS -Version 4.0
#Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
#>

[CmdletBinding()]
param( 
    [Parameter(Mandatory=$True, ValueFromPipeline=$False, Position=0)]
        [String] $Clustername
        
)

Begin {
    $Validate = $True

    if (($myCluster = Get-Cluster -Name $Clustername).count -lt 1) {
       $Validate = $False
       throw "No Cluster '$myCluster' found"
    }
    if (($myHosts = $myCluster | Get-VMHost).count -lt 1) {
       $Validate = $False
       throw "No Hosts in Cluster '$myCluster' found"
    }

    function Get-CDP ($VMhost){
        $VMhostProxySwitch = $VMhost.NetworkInfo.ExtensionData.ProxySwitch 
        $VMhostSwitch = $VMhost.NetworkInfo.VirtualSwitch

        $objReport = @()
        $VMhost| %{Get-View $_.ID} | 
        %{ Get-View $_.ConfigManager.NetworkSystem} | 
        %{ foreach($physnic in $_.NetworkInfo.Pnic){ 
     
            $obj = "" | Select-Object Clustername,Hostname,VMNIC,PCI,MAC,DVS,vSwitch,CDP_Port,CDP_Device,CDP_Address   
     
            $pnicInfo = $_.QueryNetworkHint($physnic.Device) 
            foreach($hint in $pnicInfo){ 
                $obj.Clustername = $VMhost.parent.name
                $obj.Hostname = $VMhost.name 
                $obj.VMNIC = $physnic.Device
                $obj.PCI = $physnic.PCI
                $obj.MAC = $physnic.Mac
                if ($backing = ($VMhostProxySwitch | where {$_.Spec.Backing.PnicSpec.PnicDevice -eq $physnic.Device}).DvsName) {
                    $obj.DVS = $backing
                    } else {
                        $obj.DVS = "-No Backing-"
                        }
                if ($backing = ($VMhostSwitch | where {$_.Nic -eq $physnic.Device}).Name) {
                    $obj.vSwitch = $backing
                    } else {
                        $obj.vSwitch = "-No Backing-"
                        }
                if( $hint.ConnectedSwitchPort ) { 
                    $obj.CDP_Port = $hint.ConnectedSwitchPort.PortId
                    $obj.CDP_Device = $hint.ConnectedSwitchPort.DevId
                    $obj.CDP_Address = $hint.ConnectedSwitchPort.Address  
                    } else { 
                        $obj.CDP_Port = "-No Info-" 
                        $obj.CDP_Device = "-No Info-" 
                        $obj.CDP_Address = "-No Info-" 
                        } 
                

            } 
            $objReport += $obj 
            } 
        } 
        $objReport 
    } 
  
}

Process {

    $MyView = @()

    if ($Validate -eq $True) {
  
        foreach ($myHost in $myHosts) {

        $CDP = Get-CDP $myHost
        $MyView += $CDP        

		}
           
       $MyView | Sort Clustername, Hostname, VMNIC

    }
    }
}