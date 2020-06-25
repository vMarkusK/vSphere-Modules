Push Commands
=========================

This page contains details on **Push** commands.

Push-vLIMessage
-------------------------


NAME
    Push-vLIMessage
    
ÜBERSICHT
    Push Messages to VMware vRealize Log Inisght.
    
    
SYNTAX
    Push-vLIMessage [-Text] <String> [-vLIServer] <String> [-vLIAgentID] <String> [[-Hostname] <String>] [[-FieldName] <String>] [[-FieldContent] <String>] [<CommonParameters>]
    
    
BESCHREIBUNG
    Push Messages to VMware vRealize Log Inisght.
    

PARAMETER
    -Text <String>
        Specify the Event Text
        
    -vLIServer <String>
        Specify the vLI FQDN
        
    -vLIAgentID <String>
        Specify the vLI Agent ID
        
    -Hostname <String>
        Specify the Hostanme displayed in vLI
        
    -FieldName <String>
        Specify the a Optinal Field Name for vLI
        
    -FieldContent <String>
        Specify the a Optinal FieldContent for the Field in -FieldName for vLI
        If FielName is missing and FielContent is given, it will be ignored
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable und OutVariable. Weitere Informationen finden Sie unter 
        "about_CommonParameters" (https:/go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Push-vLIMessage -vLIServer "loginsight.lan.local -vLIAgentID "12862842-5A6D-679C-0E38-0E2BE888BB28" -Text "My Test"
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Push-vLIMessage -vLIServer "loginsight.lan.local -vLIAgentID "12862842-5A6D-679C-0E38-0E2BE888BB28" -Text "My Test" -Hostname MyTEST -FieldName myTest -FieldContent myTest
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Push-vLIMessage -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Push-vLIMessage -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Push-vLIMessage -full".
    Geben Sie zum Abrufen der Onlinehilfe Folgendes ein: "get-help Push-vLIMessage -online"



