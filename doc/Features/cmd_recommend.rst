Recommend Commands
=========================

This page contains details on **Recommend** commands.

Recommend-Sizing
-------------------------


NAME
    Recommend-Sizing
    
SYNOPSIS
    
    
SYNTAX
    Recommend-Sizing [-ClusterNames] <Array> [[-Stats]] [[-StatsRange] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    This Function collects Basic vSphere Informations for a Hardware Sizing Recommandation. Focus is in Compute Ressources.
    

PARAMETERS
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
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Recommend-Sizing -ClusterNames Cluster01, Cluster02 -Stats -StatsRange 60 -Verbose
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Recommend-Sizing -ClusterNames Cluster01, Cluster02
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Recommend-Sizing -ClusterNames Cluster01
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Recommend-Sizing -examples".
    For more information, type: "get-help Recommend-Sizing -detailed".
    For technical information, type: "get-help Recommend-Sizing -full".




