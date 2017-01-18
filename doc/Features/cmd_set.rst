Set Commands
=========================

This page contains details on **Set** commands.

Set-CBT
-------------------------


NAME
    Set-CBT
    
ÜBERSICHT
    
    
SYNTAX
    Set-CBT [-myVMs] <InventoryItemImpl[]> [[-EnableCBT]] [<CommonParameters>]
    
    Set-CBT [-myVMs] <InventoryItemImpl[]> [[-DisableCBT]] [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function enables or disables CBT.
    

PARAMETER
    -myVMs <InventoryItemImpl[]>
        
    -EnableCBT [<SwitchParameter>]
        Enables CBT for any VMs found with it disabled
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    -DisableCBT [<SwitchParameter>]
        Disables CBT for any VMs found with it enabled
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: "Verbose", "Debug",
        "ErrorAction", "ErrorVariable", "WarningAction", "WarningVariable",
        "OutBuffer", "PipelineVariable" und "OutVariable". Weitere Informationen finden Sie unter 
        "about_CommonParameters" (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-VN TST* | Set-CBT -DisableCBT
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Get-VN TST* | Set-CBT -EnableCBT
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Set-CBT -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Set-CBT -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Set-CBT -full".


Set-ConsolidationFix
-------------------------

NAME
    Set-ConsolidationFix
    
ÜBERSICHT
    Set VM SnapShot Consolidation Timout Workaround
    
    
SYNTAX
    Set-ConsolidationFix [-vCenterVM] <String> [-Fix] <String> [<CommonParameters>]
    
    
BESCHREIBUNG
    Set VM SnapShot Consolidation Timout Workaround
    

PARAMETER
    -vCenterVM <String>
        
    -Fix <String>
        Timeout os Stun
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: "Verbose", "Debug",
        "ErrorAction", "ErrorVariable", "WarningAction", "WarningVariable",
        "OutBuffer", "PipelineVariable" und "OutVariable". Weitere Informationen finden Sie unter 
        "about_CommonParameters" (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Set-ConsolidationFix -vCenterVM "myTest" -Fix "Timeout"
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Set-ConsolidationFix -vCenterVM "myTest" -Fix "Stun"
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Set-ConsolidationFix -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Set-ConsolidationFix -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Set-ConsolidationFix -full".
    Geben Sie zum Abrufen der Onlinehilfe Folgendes ein: "get-help Set-ConsolidationFix -online"


Set-IOPSLimit
-------------------------

NAME
    Set-IOPSLimit
    
ÜBERSICHT
    
    
SYNTAX
    Set-IOPSLimit [-VMs] <InventoryItemImpl[]> [-ConfigPath] <String> [[-Exclusions] <String>] [[-SetLimit]] [<CommonParameters>]
    
    
BESCHREIBUNG
    Report and Set VM Disk IO Limits
    

PARAMETER
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
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: "Verbose", "Debug",
        "ErrorAction", "ErrorVariable", "WarningAction", "WarningVariable",
        "OutBuffer", "PipelineVariable" und "OutVariable". Weitere Informationen finden Sie unter 
        "about_CommonParameters" (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Get-VM -Name TST* | Set-IOPSLimit -ConfigPath C:\Scripts\vSphere-Modules\Set-IOPSLimit.xml -SetLimit | ft -AutoSize
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Get-VM -Name TST* | Set-IOPSLimit -ConfigPath C:\Scripts\vSphere-Modules\Set-IOPSLimit.xml | ft -AutoSize
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Set-IOPSLimit -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Set-IOPSLimit -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Set-IOPSLimit -full".




