Konfig Commands
=========================

This page contains details on **Konfig** commands.

Konfig-ESXi
-------------------------


NAME
    Konfig-ESXi
    
ÜBERSICHT
    
    
SYNTAX
    Konfig-ESXi [-VMHost] <String> [-NTP] <Array> [-syslog] <String> [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function sets the Basic settings for a new ESXi.
    
    * NTP
    * SSH
    * Syslog
    * Power Management
    * HP 3PAR SATP/PSP Rule
    * ...
    

PARAMETER
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
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: "Verbose", "Debug",
        "ErrorAction", "ErrorVariable", "WarningAction", "WarningVariable",
        "OutBuffer", "PipelineVariable" und "OutVariable". Weitere Informationen finden Sie unter 
        "about_CommonParameters" (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Konfig-ESXi -VMHost myesxi.lan.local -NTP 192.168.2.1, 192.168.2.2 -syslog "udp://loginsight.lan.local:514"
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Konfig-ESXi -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Konfig-ESXi -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Konfig-ESXi -full".




