<a name="Title">
# Title

vSphere Modules
===============

|Navigation|
|-----------------|
|[About](#About)|
|[Modules](#Modules)|

<a name="About">
# About

[*Back to top*](#Title)

## This is my Module Collection for VMware vSphere. 

`My PS C:\Users\mkraus\Documents\GitHub\vSphere-Modules> Get-ChildItem -Name *.psm1 | %{Import-Module .\$_}`


<a name="Modules">
# Modules

[*Back to top*](#Title)


## Get-VMID.psm1

This Funcion will quickly return all IDs of VMs.

![Get-VMID](/Media/Get-VMID.png)

## Get-VMmaxIOPS.psm1

This Function will Create a VM Disk IOPS Report.

![Get-VMmaxIOPS](/Media/Get-VMmaxIOPS.png)

## Push-vLIMessage.psm1

Push Messages to VMware vRealize Log Inisght.

## Set-ConsolidationFix.psm1

Set VM SnapShot Consolidation Timout Workaround.

## Start-UNMAP.psm1

Process SCSI UNMAP on VMware Datastores.

![Start-UNMAP](/Media/Start-UNMAP.png)

## Get-VMDisk.psm1

This Function reports VM vDisks and Datastores.

![Get-VMDisk](/Media/Get-VMDisk.png)

## Apply-Hardening.psm1

Applys a set of Hardening options to the VMss

![Apply-Hardening](/Media/Apply-Hardening.png)

## Set-IOPSLimit.psm1

Report and Set VM Disk IO Limits 

![Set-IOPSLimit](/Media/Set-IOPSLimit.png)

## Set-CBT.psm1

This Function enables or disables CBT.

![Set-CBT](/Media/Set-CBT.png)

## Recommend-Sizing.psm1

This Function collects Basic vSphere Informations for a Hardware Sizing Recommandation. Focus is in Compute Ressources.   

![Set-IOPSLimit](/Media/Recommend-Sizing.png)