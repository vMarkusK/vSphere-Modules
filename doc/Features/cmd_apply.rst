Apply Commands
=========================

This page contains details on **Apply** commands.

Apply-Hardening
-------------------------


NAME
    Apply-Hardening
    
ÜBERSICHT
    
    
SYNTAX
    Apply-Hardening [-VMs] <InventoryItemImpl[]> [<CommonParameters>]
    
    
BESCHREIBUNG
    Applys a set of Hardening options to your VMs
    

PARAMETER
    -VMs <InventoryItemImpl[]>
        Specify the VMs 
        
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: "Verbose", "Debug",
        "ErrorAction", "ErrorVariable", "WarningAction", "WarningVariable",
        "OutBuffer", "PipelineVariable" und "OutVariable". Weitere Informationen finden Sie unter 
        "about_CommonParameters" (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-VM TST* | Apply-Hardening
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>$SampleVMs = Get-VM "TST*"
    
    Apply-Hardening -VMs $SampleVMs
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Apply-Hardening -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Apply-Hardening -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Apply-Hardening -full".




