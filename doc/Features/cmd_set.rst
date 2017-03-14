Set Commands
=========================

This page contains details on **Set** commands.

Set-CBT
-------------------------


NAME
    Set-CBT
    
SYNOPSIS
    
    
SYNTAX
    Set-CBT [-myVMs] <InventoryItemImpl[]> [[-EnableCBT]] [<CommonParameters>]
    
    Set-CBT [-myVMs] <InventoryItemImpl[]> [[-DisableCBT]] [<CommonParameters>]
    
    
DESCRIPTION
    This Function enables or disables CBT.
    

PARAMETERS
    -myVMs <InventoryItemImpl[]>
        
    -EnableCBT [<SwitchParameter>]
        Enables CBT for any VMs found with it disabled
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    -DisableCBT [<SwitchParameter>]
        Disables CBT for any VMs found with it enabled
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-VN TST* | Set-CBT -DisableCBT
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-VN TST* | Set-CBT -EnableCBT
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Set-CBT -examples".
    For more information, type: "get-help Set-CBT -detailed".
    For technical information, type: "get-help Set-CBT -full".


Set-ConsolidationFix
-------------------------

NAME
    Set-ConsolidationFix
    
SYNOPSIS
    Set VM SnapShot Consolidation Timout Workaround
    
    
SYNTAX
    Set-ConsolidationFix [-vCenterVM] <String> [-Fix] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Set VM SnapShot Consolidation Timout Workaround
    

PARAMETERS
    -vCenterVM <String>
        
    -Fix <String>
        Timeout os Stun
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Set-ConsolidationFix -vCenterVM "myTest" -Fix "Timeout"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Set-ConsolidationFix -vCenterVM "myTest" -Fix "Stun"
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Set-ConsolidationFix -examples".
    For more information, type: "get-help Set-ConsolidationFix -detailed".
    For technical information, type: "get-help Set-ConsolidationFix -full".
    For online help, type: "get-help Set-ConsolidationFix -online"


Set-IOPSLimit
-------------------------

NAME
    Set-IOPSLimit
    
SYNOPSIS
    
    
SYNTAX
    Set-IOPSLimit [-VMs] <InventoryItemImpl[]> [-ConfigPath] <String> [[-Exclusions] <String>] [[-SetLimit]] [<CommonParameters>]
    
    
DESCRIPTION
    Report and Set VM Disk IO Limits
    

PARAMETERS
    -VMs <InventoryItemImpl[]>
        Specify the VMs
        
    -ConfigPath <String>
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
        
    -Exclusions <String>
        
    -SetLimit [<SwitchParameter>]
        Switch to enforce the Limits
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-VM -Name TST* | Set-IOPSLimit -ConfigPath C:\Scripts\vSphere-Modules\Set-IOPSLimit.xml -SetLimit | ft -AutoSize
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-VM -Name TST* | Set-IOPSLimit -ConfigPath C:\Scripts\vSphere-Modules\Set-IOPSLimit.xml | ft -AutoSize
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Set-IOPSLimit -examples".
    For more information, type: "get-help Set-IOPSLimit -detailed".
    For technical information, type: "get-help Set-IOPSLimit -full".




