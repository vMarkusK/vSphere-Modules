Update Commands
=========================

This page contains details on **Update** commands.

Update-ModuleManifestData
-------------------------


NAME
    Update-ModuleManifestData
    
SYNOPSIS
    Bump the version of a module manifest file
    
    
SYNTAX
    Update-ModuleManifestData -Path <String> -Major [<CommonParameters>]
    
    Update-ModuleManifestData -Path <String> -Minor [<CommonParameters>]
    
    Update-ModuleManifestData -Path <String> -Patch [<CommonParameters>]
    
    
DESCRIPTION
    Increment the version number of a module manifest file by following the Semantic Versioning standard -> http://semver.org/
    
    It is possible to update either the MAJOR,MINOR or PATCH patch version of the module depending on what changes have been made
    to the module.
    
    Updates FunctionsToExport and NestedModules.
    

PARAMETERS
    -Path <String>
        The path to the module manifest file
        
    -Major [<SwitchParameter>]
        Increase the major version of the module by 1
        
    -Minor [<SwitchParameter>]
        Increase the minor version of the module by 1
        
    -Patch [<SwitchParameter>]
        Increase the patch version of the module by 1
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Update-ModuleManifestData -Path .\ModuleManifest.psd1 -Major
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Update-ModuleManifestData -Path .\ModuleManifest.psd1 -Minor
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Update-ModuleManifestData -Path .\ModuleManifest.psd1 -Patch
    
    #Requires PS -Version 5.0
    
    
    
    
REMARKS
    To see the examples, type: "get-help Update-ModuleManifestData -examples".
    For more information, type: "get-help Update-ModuleManifestData -detailed".
    For technical information, type: "get-help Update-ModuleManifestData -full".


Update-PowerShellGallery
-------------------------

NAME
    Update-PowerShellGallery
    
SYNOPSIS
    
    
SYNTAX
    Update-PowerShellGallery [-Path] <String> [-ApiKey] <String> [<CommonParameters>]
    
    
DESCRIPTION
    

PARAMETERS
    -Path <String>
        
    -ApiKey <String>
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Update-PowerShellGallery -Path .\My-Folder -ApiKey 'c5bb9aea-333-666-9b34-e8c70eb1fdb2'
    
    #Requires PS -Version 5.0
    
    
    
    
REMARKS
    To see the examples, type: "get-help Update-PowerShellGallery -examples".
    For more information, type: "get-help Update-PowerShellGallery -detailed".
    For technical information, type: "get-help Update-PowerShellGallery -full".




