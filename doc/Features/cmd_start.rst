Start Commands
=========================

This page contains details on **Start** commands.

Start-UNMAP
-------------------------


NAME
    Start-UNMAP
    
SYNOPSIS
    Process SCSI UNMAP on VMware Datastores
    
    
SYNTAX
    Start-UNMAP [-ClusterName] <String> [-DSWildcard] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    This Function will process SCSI UNMAP on VMware Datastores via ESXCLI -V2
    

PARAMETERS
    -ClusterName <String>
        
    -DSWildcard <String>
        
    -WhatIf [<SwitchParameter>]
        
    -Confirm [<SwitchParameter>]
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Start-UNMAP -ClusterName myCluster -DSWildcard *RAID5*
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Start-UNMAP -ClusterName myCluster -DSWildcard *RAID5* -Verbose -WhatIf
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Start-UNMAP -examples".
    For more information, type: "get-help Start-UNMAP -detailed".
    For technical information, type: "get-help Start-UNMAP -full".
    For online help, type: "get-help Start-UNMAP -online"




