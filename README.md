vSphere Modules
===============
[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=vMarkus_K&url=https://github.com/mycloudrevolution/vSphere-Modules&title=vSphere-Modules&language=Powershell&tags=github&category=software)

# About

## Project Owner:

Markus Kraus [@vMarkus_K](https://twitter.com/vMarkus_K)

MY CLOUD-(R)EVOLUTION [mycloudrevolution.com](http://mycloudrevolution.com/)

## Project Description

This Repository contains a collection of my VMware vSphere Functions.

# Modules

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

This Function enables or disables CBT. In addition a new VI-Property is added.

![Set-CBT](/Media/Set-CBT.png)

![Set-CBT_VI-Property](/Media/Set-CBT_VI-Property.png)

## Recommend-Sizing.psm1

This Function collects Basic vSphere Informations for a Hardware Sizing Recommandation. Focus is in Compute Ressources.   

![Set-IOPSLimit](/Media/Recommend-Sizing.png)

## Konfig-ESXi.psm1

This Function sets the Basic settings for a new ESXi.   

![Konfig-ESXi](/Media/Konfig-ESXi.png)

## Get-NewVMs.psm1

This Function report newly created VMs by Cluster. 

Prease use the enhanced version "Get-NewAndRemovedVMs" insted!  

![Get-NewVMs](/Media/Get-NewVMs.png)

## Get-NewAndRemovedVMs.psm1

This Function report newly created VMs by Cluster.   

![Get-NewAndRemovedVMs](/Media/Get-NewAndRemovedVMs.png)

## Get-NICDetails.psm1

This Function reports Firmware and Driver Details for your ESXi vmnic(s).

![Get-NICDetails](/Media/Get-NICDetails.png)

## Get-UplinkDetails.psm1

This Function collects detailed informations about your ESXi Host connections to pSwitch and DVS / vSwitch.

![Get-UplinkDetails](/Media/Get-UplinkDetails.png)

## Validate-ESXiPackages.psm1

This Function compares all ESXi Host VIBs within a vSphere with a reference Hosts.

![Validate-ESXiPackages](/Media/Validate-ESXiPackages.png)