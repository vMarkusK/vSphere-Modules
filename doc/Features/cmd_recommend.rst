Recommend Commands
=========================

This page contains details on **Recommend** commands.

Recommend-Sizing
-------------------------


NAME
    Recommend-Sizing
    
ÜBERSICHT
    
    
SYNTAX
    Recommend-Sizing [-ClusterNames] <Array> [[-Stats]] [[-StatsRange] <Int32>] [<CommonParameters>]
    
    
BESCHREIBUNG
    This Function collects Basic vSphere Informations for a Hardware Sizing Recommandation. Focus is in Compute Ressources.
    

PARAMETER
    -ClusterNames <Array>
        List of your vSphere Cluser Names to process.
        
    -Stats [<SwitchParameter>]
        Enables Stats Collection.
        
        Warning: At the moment this is only fully tested with vSphere 5.5 and vSphere 6.5!
        
    -StatsRange <Int32>
        Time Range in Minutes for the Stats Collection.
        Default is 24h.
        
        #Requires PS -Version 4.0
        #Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
        
    <CommonParameters>
        Dieses Cmdlet unterstützt folgende allgemeine Parameter: "Verbose", "Debug",
        "ErrorAction", "ErrorVariable", "WarningAction", "WarningVariable",
        "OutBuffer", "PipelineVariable" und "OutVariable". Weitere Informationen finden Sie unter 
        "about_CommonParameters" (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- BEISPIEL 1 --------------------------
    
    PS C:\>Recommend-Sizing -ClusterNames Cluster01, Cluster02 -Stats -StatsRange 60 -Verbose
    
    
    
    
    
    
    -------------------------- BEISPIEL 2 --------------------------
    
    PS C:\>Recommend-Sizing -ClusterNames Cluster01, Cluster02
    
    
    
    
    
    
    -------------------------- BEISPIEL 3 --------------------------
    
    PS C:\>Recommend-Sizing -ClusterNames Cluster01
    
    
    
    
    
    
HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help Recommend-Sizing -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help Recommend-Sizing -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help Recommend-Sizing -full".




