<#

        .SYNOPSIS
        Bump the version of a module manifest file

        .DESCRIPTION
        Increment the version number of a module manifest file by following the Semantic Versioning standard -> http://semver.org/

        It is possible to update either the MAJOR,MINOR or PATCH patch version of the module depending on what changes have been made
        to the module.

        Updates FunctionsToExport and NestedModules.

        .PARAMETER Path
        The path to the module manifest file

        .PARAMETER Major
        Increase the major version of the module by 1

        .PARAMETER Minor
        Increase the minor version of the module by 1

        .PARAMETER Patch
        Increase the patch version of the module by 1

        .EXAMPLE
        Update-ModuleManifestData -Path .\ModuleManifest.psd1 -Major

        .EXAMPLE
        Update-ModuleManifestData -Path .\ModuleManifest.psd1 -Minor

        .EXAMPLE
        Update-ModuleManifestData -Path .\ModuleManifest.psd1 -Patch

#Requires PS -Version 5.0
#>
function Update-ModuleManifestData {

[CmdletBinding()]

    Param (

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
            [String]$Path,
        
        [Parameter(Mandatory=$true, ParameterSetName="Major")]
        [ValidateNotNullOrEmpty()]
            [Switch]$Major,

        [Parameter(Mandatory=$true, ParameterSetName="Minor")]
        [ValidateNotNullOrEmpty()]
            [Switch]$Minor,

        [Parameter(Mandatory=$true, ParameterSetName="Patch")]
        [ValidateNotNullOrEmpty()]
            [Switch]$Patch

    )

    Write-Verbose -Message "Working with manifest file $($Path)"

    if (!(Test-Path -Path $Path)) {

        throw "Could not find file: $($Path)"

    }

    $ModuleManifest = Get-Item -Path $Path
    $ResolvedPath = Resolve-Path -Path $Path -ErrorAction Stop | Select-Object -ExpandProperty Path

    Write-Verbose -Message "Resolved path: $($ResolvedPath)"
    $ModuleManifest_String = Invoke-Expression -Command (Get-Content -Path $ResolvedPath | Out-String)
    $CurrentModuleVersion = $ModuleManifest_String.ModuleVersion

    Write-Verbose -Message "Current module version is $($CurrentModuleVersion)"

    [Int]$MajorVersion = $CurrentModuleVersion.Split(".")[0]
    [Int]$MinorVersion = $CurrentModuleVersion.Split(".")[1]
    [Int]$PatchVersion = $CurrentModuleVersion.Split(".")[2]

    switch ($PSCmdlet.ParameterSetName) {

        'Major' {

            Write-Verbose -Message "Bumping module major release number"

            $MajorVersion++
            $MinorVersion = 0
            $PatchVersion = 0

            break

        }

        'Minor' {

            Write-Verbose -Message "Bumping module minor release number"

            $MinorVersion++
            $PatchVersion = 0

            break

        }

        'Patch' {

            Write-Verbose -Message "Bumping module patch release number"

            $PatchVersion++

            break
        }

    }
    $ModuleVersion = "$($MajorVersion).$($MinorVersion).$($PatchVersion)"

    Write-Verbose -Message "Module version updated to $($ModuleVersion)"

    Write-Verbose -Message "Searching for functions in $("$($ModuleManifest.DirectoryName)")"

    $ModuleRoot = $ModuleManifest.DirectoryName.Split("\")[-1]

    $Functions = Get-ChildItem -Path "$($ModuleManifest.DirectoryName)" -Filter '*.psm1' -Recurse | Sort-Object

    $FunctionsToExport  = $Functions | Select-Object -ExpandProperty BaseName | Sort-Object
    $NestedModules = $Functions | % {$_.FullName.Substring($_.FullName.IndexOf($ModuleRoot)+$ModuleRoot.Length).Trim("\")}

    Write-Verbose -Message "Found $($Functions.Count) function(s)"
    $FunctionsToExport

    if (!$Functions) {

        throw "No functions found"

    }

    Update-ModuleManifest -Path $Path -ModuleVersion $ModuleVersion -NestedModules $NestedModules -FunctionsToExport $FunctionsToExport -CmdletsToExport * -AliasesToExport * -VariablesToExport * -Verbose:$VerbosePreference

}