Start Commands
=========================

This page contains details on **Start** commands.

Start-UNMAP
-------------------------


NAME
    Start-UNMAP
    
ÜBERSICHT
    Process SCSI UNMAP on VMware Datastores
    
    
SYNTAX
    Start-UNMAP [-ClusterName] <String> [-DSWildcard] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function will process SCSI UNMAP on VMware Datastores via ESXCLI -V2
    

PARAMETER
    -ClusterName <String>
        
    -DSWildcard <String>
        
    -WhatIf [<SwitchParameter>]
        
    -Confirm [<SwitchParameter>]
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: "Verbose", "Debug",
        "ErrorAction", "ErrorVariable", "WarningAction", "WarningVariable",
        "OutBuffer", "PipelineVariable" und "OutVariable". Weitere Informationen finden Sie unter 
        "about_CommonParameters" (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Start-UNMAP -ClusterName myCluster -DSWildcard *RAID5*
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Start-UNMAP -ClusterName myCluster -DSWildcard *RAID5* -Verbose -WhatIf
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Start-UNMAP -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Start-UNMAP -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Start-UNMAP -full".
    Geben Sie zum Abrufen der Onlinehilfe Folgendes ein: "get-help Start-UNMAP -online"




