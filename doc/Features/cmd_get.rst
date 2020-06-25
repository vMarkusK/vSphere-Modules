Get Commands
=========================

This page contains details on **Get** commands.

Get-NewAndRemovedVMs
-------------------------


NAME
    Get-NewAndRemovedVMs
    
ÜBERSICHT
    
    
SYNTAX
    Get-NewAndRemovedVMs [-ClusterName] <String> [[-Summary]] [[-Days] <String>] [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function report newly created and deleted VMs by Cluster.
    

PARAMETER
    -ClusterName <String>
        Name or Wildcard of your vSphere Cluster Name(s) to report.
        
    -Summary [<SwitchParameter>]
        Displays only a short summary instead of the whole report.
        
    -Days <String>
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-NewAndRemovedVMs -ClusterName Cluster* | ft -AutoSize
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Get-NewAndRemovedVMs -ClusterName Cluster01 -Days 90
    
    
    
    
    
    
    -------------------------- BEISPIEL 3 --------------------------
    
    PS C:\>Get-NewAndRemovedVMs -ClusterName * -Days 90 -Summary
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Get-NewAndRemovedVMs -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Get-NewAndRemovedVMs -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Get-NewAndRemovedVMs -full".


Get-NewVMs
-------------------------

NAME
    Get-NewVMs
    
ÜBERSICHT
    
    
SYNTAX
    Get-NewVMs [-ClusterName] <Object> [[-Days] <String>] [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function report newly created VMs by Cluster.
    

PARAMETER
    -ClusterName <Object>
        List or Wildcard of your vSphere Cluser Names to process.
        
    -Days <String>
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-NewVMs -ClusterName Cluster* | ft -AutoSize
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Get-NewVMs -ClusterName Cluster01
    
    
    
    
    
    
    -------------------------- BEISPIEL 3 --------------------------
    
    PS C:\>Get-NewVMs -ClusterName Cluster01, Cluster02 -Days 60 | ft -AutoSize
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Get-NewVMs -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Get-NewVMs -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Get-NewVMs -full".


Get-NICDetails
-------------------------

NAME
    Get-NICDetails
    
ÜBERSICHT
    
    
SYNTAX
    Get-NICDetails [-Clustername] <String> [<CommonParameters>]
    
    
BESCHREIBUNG
    Reports Firmware and Driver Details for your ESXi vmnics.
    

PARAMETER
    -Clustername <String>
        Name or Wildcard of your vSphere Cluster Name to process.
        
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-NICDetails -Clustername *
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Get-NICDetails -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Get-NICDetails -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Get-NICDetails -full".


Get-UplinkDetails
-------------------------

NAME
    Get-UplinkDetails
    
ÜBERSICHT
    
    
SYNTAX
    Get-UplinkDetails [-Clustername] <String> [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function collects detailed informations about your ESXi Host connections to pSwitch and DVS / vSwitch
    

PARAMETER
    -Clustername <String>
        Your vSphere Cluster Name or Wildcard
        
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-UplinkDetails -Clustername * | ft -AutoSize
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Get-UplinkDetails -Clustername MyCluster001 | ft -AutoSize
    
    
    
    
    
    
    -------------------------- BEISPIEL 3 --------------------------
    
    PS C:\>Get-UplinkDetails -Clustername MyCluster* | Sort Clustername, Hostname, DVS | ft -AutoSize
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Get-UplinkDetails -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Get-UplinkDetails -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Get-UplinkDetails -full".


Get-VMDisk
-------------------------

NAME
    Get-VMDisk
    
ÜBERSICHT
    
    
SYNTAX
    Get-VMDisk [-myVMs] <InventoryItemImpl[]> [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function reports VM vDisks and Datastores:
    
    Get-VM MyTest | Get-VMDisk | Format-Table -AutoSize
    
    Name   PowerState Datastore Path                  Disk        StorageFormat CapacityGB Controller Unit
    ----   ---------- --------- ----                  ----        ------------- ---------- ---------- ----
    MyTest PoweredOff data01     MyTest/MyTest.vmdk   Hard disk 1          Thin         16          0    0
    MyTest PoweredOff data02     MyTest/MyTest_1.vmdk Hard disk 2          Thin         20          1    0
    MyTest PoweredOff data01     MyTest/MyTest_2.vmdk Hard disk 3         Thick         20          1    1
    

PARAMETER
    -myVMs <InventoryItemImpl[]>
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-VM -Name TST* | Get-VMDisk
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Get-Folder -Name TST | Get-VM | Get-VMDisk | ft -AutoSize
    
    #Requires PS -Version 5.0
    #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Get-VMDisk -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Get-VMDisk -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Get-VMDisk -full".


Get-VMHostUplinkDetails
-------------------------

NAME
    Get-VMHostUplinkDetails
    
ÜBERSICHT
    
    
SYNTAX
    Get-VMHostUplinkDetails [-VMHost] <VMHost[]> [-Type] <String> [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function collects detailed informations about your ESXi Host connections to pSwitch and VDS / vSwitch. 
    LLDP Informations might only be available when uplinks are connected to a VDS.
    

PARAMETER
    -VMHost <VMHost[]>
        
    -Type <String>
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-VMHost -Name MyHost | Get-VMHostUplinkDetails -Type LLDP | Where-Object {$_.VDS -ne "-No Backing-"}  | Format-Table -AutoSize
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Get-VMHost -Name MyHost | Get-VMHostUplinkDetails -Type CDP | Where-Object {$_.VDS -ne "-No Backing-"}  | Sort-Object ClusterName, HostName, vmnic | Format-Table -AutoSize
    
    
    
    
    
    
    -------------------------- BEISPIEL 3 --------------------------
    
    PS C:\>Get-Cluster -Name MyCluster | Get-VMHost | Get-VMHostUplinkDetails -Type LLDP | Format-Table -AutoSize
    
    
    
    
    
    
    -------------------------- BEISPIEL 4 --------------------------
    
    PS C:\>Get-Cluster -Name MyCluster | Get-VMHost | Get-VMHostUplinkDetails -Type CDP | Format-Table -AutoSize
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Get-VMHostUplinkDetails -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Get-VMHostUplinkDetails -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Get-VMHostUplinkDetails -full".


Get-VMID
-------------------------

NAME
    Get-VMID
    
ÜBERSICHT
    
    
SYNTAX
    Get-VMID [-myVMs] <InventoryItemImpl[]> [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function reports all VM IDs
    

PARAMETER
    -myVMs <InventoryItemImpl[]>
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-VM -Name TST* | Get-VMID
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Get-Folder -Name TST | Get-VM | Get-VMID | ft -AutoSize
    
    #Requires PS -Version 4.0
    #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Get-VMID -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Get-VMID -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Get-VMID -full".


Get-VMmaxIOPS
-------------------------

NAME
    Get-VMmaxIOPS
    
ÜBERSICHT
    
    
SYNTAX
    Get-VMmaxIOPS [-VMs] <InventoryItemImpl[]> [[-Minutes] <Int32>] [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function will Create a VM Disk IOPS Report
    

PARAMETER
    -VMs <InventoryItemImpl[]>
        Specify the VMs
        
    -Minutes <Int32>
        Time Range in Minutes for the Stats Collection.
        Default is 30 Minutes.
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-Folder -Name TST | Get-VM | where {$_.PowerState -eq "PoweredOn"} | Get-VMmaxIOPS -Minutes 120 | ft -AutoSize
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Get-Cluster -Name TST | Get-VM | where {$_.PowerState -eq "PoweredOn"} | Get-VMmaxIOPS
    
    
    
    
    
    
    -------------------------- BEISPIEL 3 --------------------------
    
    PS C:\>Get-VM -Name TST*| where {$_.PowerState -eq "PoweredOn"} | Get-VMmaxIOPS -Minutes 120 | ft -AutoSize
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Get-VMmaxIOPS -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Get-VMmaxIOPS -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Get-VMmaxIOPS -full".




