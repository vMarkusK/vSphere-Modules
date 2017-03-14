#
# Modulmanifest für das Modul "PSGet_vSphere-Modules"
#
# Generiert von: Markus Kraus
#
# Generiert am: 15.03.2017
#

@{

# Die diesem Manifest zugeordnete Skript- oder Binärmoduldatei.
# RootModule = ''

# Die Versionsnummer dieses Moduls
ModuleVersion = '1.0.4'

# ID zur eindeutigen Kennzeichnung dieses Moduls
GUID = '7274fb26-4736-4a3e-9a23-2f05a9f1b9b6'

# Autor dieses Moduls
Author = 'Markus Kraus'

# Unternehmen oder Hersteller dieses Moduls
CompanyName = 'mycloudrevolution.com'

# Urheberrechtserklärung für dieses Modul
Copyright = '(c) 2017 Markus Kraus. Alle Rechte vorbehalten.'

# Beschreibung der von diesem Modul bereitgestellten Funktionen
# Description = ''

# Die für dieses Modul mindestens erforderliche Version des Windows PowerShell-Moduls
# PowerShellVersion = ''

# Der Name des für dieses Modul erforderlichen Windows PowerShell-Hosts
# PowerShellHostName = ''

# Die für dieses Modul mindestens erforderliche Version des Windows PowerShell-Hosts
# PowerShellHostVersion = ''

# Die für dieses Modul mindestens erforderliche Microsoft .NET Framework-Version
# DotNetFrameworkVersion = ''

# Die für dieses Modul mindestens erforderliche Version der CLR (Common Language Runtime)
# CLRVersion = ''

# Die für dieses Modul erforderliche Prozessorarchitektur ("Keine", "X86", "Amd64").
# ProcessorArchitecture = ''

# Die Module, die vor dem Importieren dieses Moduls in die globale Umgebung geladen werden müssen
# RequiredModules = @()

# Die Assemblys, die vor dem Importieren dieses Moduls geladen werden müssen
# RequiredAssemblies = @()

# Die Skriptdateien (PS1-Dateien), die vor dem Importieren dieses Moduls in der Umgebung des Aufrufers ausgeführt werden.
# ScriptsToProcess = @()

# Die Typdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# TypesToProcess = @()

# Die Formatdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# FormatsToProcess = @()

# Die Module, die als geschachtelte Module des in "RootModule/ModuleToProcess" angegebenen Moduls importiert werden sollen.
NestedModules = @('Apply-Hardening.psm1', 
               'Get-NewAndRemovedVMs.psm1', 
               'Get-NewVMs.psm1', 
               'Get-NICDetails.psm1', 
               'Get-UplinkDetails.psm1', 
               'Get-VMDisk.psm1', 
               'Get-VMID.psm1', 
               'Get-VMmaxIOPS.psm1', 
               'Konfig-ESXi.psm1', 
               'Push-vLIMessage.psm1', 
               'Recommend-Sizing.psm1', 
               'Set-CBT.psm1', 
               'Set-ConsolidationFix.psm1', 
               'Set-IOPSLimit.psm1', 
               'Start-UNMAP.psm1', 
               'Helper\Update-ModuleManifestData.psm1', 
               'Helper\Update-PowerShellGallery.psm1')

# Aus diesem Modul zu exportierende Funktionen
FunctionsToExport = 'Apply-Hardening', 'Get-NewAndRemovedVMs', 'Get-NewVMs', 
               'Get-NICDetails', 'Get-UplinkDetails', 'Get-VMDisk', 'Get-VMID', 
               'Get-VMmaxIOPS', 'Konfig-ESXi', 'Push-vLIMessage', 'Recommend-Sizing', 
               'Set-CBT', 'Set-ConsolidationFix', 'Set-IOPSLimit', 'Start-UNMAP', 
               'Update-ModuleManifestData', 'Update-PowerShellGallery'

# Aus diesem Modul zu exportierende Cmdlets
CmdletsToExport = '*'

# Die aus diesem Modul zu exportierenden Variablen
VariablesToExport = '*'

# Aus diesem Modul zu exportierende Aliase
AliasesToExport = '*'

# Aus diesem Modul zu exportierende DSC-Ressourcen
# DscResourcesToExport = @()

# Liste aller Module in diesem Modulpaket
# ModuleList = @()

# Liste aller Dateien in diesem Modulpaket
# FileList = @()

# Die privaten Daten, die an das in "RootModule/ModuleToProcess" angegebene Modul übergeben werden sollen. Diese können auch eine PSData-Hashtabelle mit zusätzlichen von PowerShell verwendeten Modulmetadaten enthalten.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo-URI dieses Moduls
# HelpInfoURI = ''

# Standardpräfix für Befehle, die aus diesem Modul exportiert werden. Das Standardpräfix kann mit "Import-Module -Prefix" überschrieben werden.
# DefaultCommandPrefix = ''

}

