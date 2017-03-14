Push Commands
=========================

This page contains details on **Push** commands.

Push-vLIMessage
-------------------------


NAME
    Push-vLIMessage
    
SYNOPSIS
    Push Messages to VMware vRealize Log Inisght.
    
    
SYNTAX
    Push-vLIMessage [-Text] <String> [-vLIServer] <String> [-vLIAgentID] <String> [[-Hostname] <String>] [[-FieldName] <String>] 
    [[-FieldContent] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Push Messages to VMware vRealize Log Inisght.
    

PARAMETERS
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
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Push-vLIMessage -vLIServer "loginsight.lan.local -vLIAgentID "12862842-5A6D-679C-0E38-0E2BE888BB28" -Text "My Test"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Push-vLIMessage -vLIServer "loginsight.lan.local -vLIAgentID "12862842-5A6D-679C-0E38-0E2BE888BB28" -Text "My Test" -Hostname 
    MyTEST -FieldName myTest -FieldContent myTest
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Push-vLIMessage -examples".
    For more information, type: "get-help Push-vLIMessage -detailed".
    For technical information, type: "get-help Push-vLIMessage -full".
    For online help, type: "get-help Push-vLIMessage -online"




