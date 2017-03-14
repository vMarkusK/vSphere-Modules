Apply Commands
=========================

This page contains details on **Apply** commands.

Apply-Hardening
-------------------------


NAME
    Apply-Hardening
    
SYNOPSIS
    
    
SYNTAX
    Apply-Hardening [-VMs] <InventoryItemImpl[]> [<CommonParameters>]
    
    
DESCRIPTION
    Applys a set of Hardening options to your VMs
    

PARAMETERS
    -VMs <InventoryItemImpl[]>
        Specify the VMs 
        
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-VM TST* | Apply-Hardening
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>$SampleVMs = Get-VM "TST*"
    
    Apply-Hardening -VMs $SampleVMs
    
    
    
    
REMARKS
    To see the examples, type: "get-help Apply-Hardening -examples".
    For more information, type: "get-help Apply-Hardening -detailed".
    For technical information, type: "get-help Apply-Hardening -full".




