Get Commands
=========================

This page contains details on **Get** commands.

Get-NewAndRemovedVMs
-------------------------


NAME
    Get-NewAndRemovedVMs
    
SYNOPSIS
    
    
SYNTAX
    Get-NewAndRemovedVMs [-ClusterName] <String> [[-Summary]] [[-Days] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This Function report newly created and deleted VMs by Cluster.
    

PARAMETERS
    -ClusterName <String>
        Name or Wildcard of your vSphere Cluster Name(s) to report.
        
    -Summary [<SwitchParameter>]
        Displays only a short summary instead of the whole report.
        
    -Days <String>
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-NewAndRemovedVMs -ClusterName Cluster* | ft -AutoSize
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-NewAndRemovedVMs -ClusterName Cluster01 -Days 90
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Get-NewAndRemovedVMs -ClusterName * -Days 90 -Summary
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Get-NewAndRemovedVMs -examples".
    For more information, type: "get-help Get-NewAndRemovedVMs -detailed".
    For technical information, type: "get-help Get-NewAndRemovedVMs -full".


Get-NewVMs
-------------------------

NAME
    Get-NewVMs
    
SYNOPSIS
    
    
SYNTAX
    Get-NewVMs [-ClusterName] <Object> [[-Days] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This Function report newly created VMs by Cluster.
    

PARAMETERS
    -ClusterName <Object>
        List or Wildcard of your vSphere Cluser Names to process.
        
    -Days <String>
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-NewVMs -ClusterName Cluster* | ft -AutoSize
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-NewVMs -ClusterName Cluster01
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Get-NewVMs -ClusterName Cluster01, Cluster02 -Days 60 | ft -AutoSize
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Get-NewVMs -examples".
    For more information, type: "get-help Get-NewVMs -detailed".
    For technical information, type: "get-help Get-NewVMs -full".


Get-NICDetails
-------------------------

NAME
    Get-NICDetails
    
SYNOPSIS
    
    
SYNTAX
    Get-NICDetails [-Clustername] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Reports Firmware and Driver Details for your ESXi vmnics.
    

PARAMETERS
    -Clustername <String>
        Name or Wildcard of your vSphere Cluster Name to process.
        
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-NICDetails -Clustername *
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Get-NICDetails -examples".
    For more information, type: "get-help Get-NICDetails -detailed".
    For technical information, type: "get-help Get-NICDetails -full".


Get-UplinkDetails
-------------------------

NAME
    Get-UplinkDetails
    
SYNOPSIS
    
    
SYNTAX
    Get-UplinkDetails [-Clustername] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This Function collects detailed informations about your ESXi Host connections to pSwitch and DVS / vSwitch
    

PARAMETERS
    -Clustername <String>
        Your vSphere Cluster Name or Wildcard
        
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-UplinkDetails -Clustername * | ft -AutoSize
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-UplinkDetails -Clustername MyCluster001 | ft -AutoSize
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Get-UplinkDetails -Clustername MyCluster* | Sort Clustername, Hostname, DVS | ft -AutoSize
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Get-UplinkDetails -examples".
    For more information, type: "get-help Get-UplinkDetails -detailed".
    For technical information, type: "get-help Get-UplinkDetails -full".


Get-VMDisk
-------------------------

NAME
    Get-VMDisk
    
SYNOPSIS
    
    
SYNTAX
    Get-VMDisk [-myVMs] <InventoryItemImpl[]> [<CommonParameters>]
    
    
DESCRIPTION
    This Function reports VM vDisks and Datastores:
    
    Name    PowerState Datastore     VMDK                       StorageFormat CapacityGB
    ----    ---------- ---------     ----                       ------------- ----------
    TST0003 PoweredOff DS02         TST0003/TST0003.vmdk           Thick         16
    TST0004 PoweredOff DS02         TST0004/TST0004.vmdk           Thick         16
    TST0004 PoweredOff DS02         TST0004/TST0004_1.vmdk         Thick          1
    TST0001  PoweredOn DS02         TST0001/TST0001.vmdk           Thick         16
    TST0039 PoweredOff DS02         TST0039/TST0039.vmdk           Thick         60
    TST0002  PoweredOn DS02         TST0002/TST0002.vmdk           Thick         16
    

PARAMETERS
    -myVMs <InventoryItemImpl[]>
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-VM -Name TST* | Get-VMDisk
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-Folder -Name TST | Get-VM | Get-VMDisk | ft -AutoSize
    
    #Requires PS -Version 4.0
    #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
    
    
    
    
REMARKS
    To see the examples, type: "get-help Get-VMDisk -examples".
    For more information, type: "get-help Get-VMDisk -detailed".
    For technical information, type: "get-help Get-VMDisk -full".


Get-VMID
-------------------------

NAME
    Get-VMID
    
SYNOPSIS
    
    
SYNTAX
    Get-VMID [-myVMs] <InventoryItemImpl[]> [<CommonParameters>]
    
    
DESCRIPTION
    This Function reports all VM IDs
    

PARAMETERS
    -myVMs <InventoryItemImpl[]>
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-VM -Name TST* | Get-VMID
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-Folder -Name TST | Get-VM | Get-VMID | ft -AutoSize
    
    #Requires PS -Version 4.0
    #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
    
    
    
    
REMARKS
    To see the examples, type: "get-help Get-VMID -examples".
    For more information, type: "get-help Get-VMID -detailed".
    For technical information, type: "get-help Get-VMID -full".


Get-VMmaxIOPS
-------------------------

NAME
    Get-VMmaxIOPS
    
SYNOPSIS
    
    
SYNTAX
    Get-VMmaxIOPS [-VMs] <InventoryItemImpl[]> [[-Minutes] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    This Function will Create a VM Disk IOPS Report
    

PARAMETERS
    -VMs <InventoryItemImpl[]>
        Specify the VMs
        
    -Minutes <Int32>
        Time Range in Minutes for the Stats Collection.
        Default is 30 Minutes.
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-Folder -Name TST | Get-VM | where {$_.PowerState -eq "PoweredOn"} | Get-VMmaxIOPS -Minutes 120 | ft -AutoSize
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-Cluster -Name TST | Get-VM | where {$_.PowerState -eq "PoweredOn"} | Get-VMmaxIOPS
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Get-VM -Name TST*| where {$_.PowerState -eq "PoweredOn"} | Get-VMmaxIOPS -Minutes 120 | ft -AutoSize
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Get-VMmaxIOPS -examples".
    For more information, type: "get-help Get-VMmaxIOPS -detailed".
    For technical information, type: "get-help Get-VMmaxIOPS -full".




