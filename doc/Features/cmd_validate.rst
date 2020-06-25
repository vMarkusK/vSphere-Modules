Validate Commands
=========================

This page contains details on **Validate** commands.

Validate-ESXiPackages
-------------------------


NAME
    Validate-ESXiPackages
    
ÜBERSICHT
    
    
SYNTAX
    Validate-ESXiPackages [-Cluster] <ComputeResourceImpl> [-RefernceHost] <InventoryItemImpl> [<CommonParameters>]
    
    
BESCHREIBUNG
    Compares all ESXi Host VIBs within a vSphere with a reference Hosts.
    

PARAMETER
    -Cluster <ComputeResourceImpl>
        vSphere Cluster to verify
        
    -RefernceHost <InventoryItemImpl>
        The VIB Reference ESXi Host
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Validate-ESXiPackages -Cluster (Get-Cluster) -RefernceHost (Get-VMHost | Select-Object -First 1)
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Validate-ESXiPackages -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Validate-ESXiPackages -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Validate-ESXiPackages -full".
    Geben Sie zum Abrufen der Onlinehilfe Folgendes ein: "get-help Validate-ESXiPackages -online"



