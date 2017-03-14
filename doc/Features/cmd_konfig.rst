Konfig Commands
=========================

This page contains details on **Konfig** commands.

Konfig-ESXi
-------------------------


NAME
    Konfig-ESXi
    
SYNOPSIS
    
    
SYNTAX
    Konfig-ESXi [-VMHost] <String> [-NTP] <Array> [-syslog] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This Function sets the Basic settings for a new ESXi.
    
    * NTP
    * SSH
    * Syslog
    * Power Management
    * HP 3PAR SATP/PSP Rule
    * ...
    

PARAMETERS
    -VMHost <String>
        Host to configure.
        
    -NTP <Array>
        NTP Server(s) to set.
        
    -syslog <String>
        Syslog Server to set, e.g. "udp://loginsight.lan.local:514"
        
        DNS Name must be resolvable!
        
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Konfig-ESXi -VMHost myesxi.lan.local -NTP 192.168.2.1, 192.168.2.2 -syslog "udp://loginsight.lan.local:514"
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Konfig-ESXi -examples".
    For more information, type: "get-help Konfig-ESXi -detailed".
    For technical information, type: "get-help Konfig-ESXi -full".




