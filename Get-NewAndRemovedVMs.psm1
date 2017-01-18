function Get-NewAndRemovedVMs {
<#	
    .NOTES
    ===========================================================================
    Created by: Markus Kraus
    Twitter: @VMarkus_K
    Private Blog: mycloudrevolution.com
    ===========================================================================
    Changelog:  
    2016.12 ver 1.0 Base Release 
	2017.01 ver 1.1 Added Summary
    ===========================================================================
    External Code Sources:  
    https://github.com/alanrenouf/vCheck-vSphere
    ===========================================================================
    Tested Against Environment:
    vSphere Version: 5.5 U2, 6.5
    PowerCLI Version: PowerCLI 6.3 R1, PowerCLI 6.5 R1
    PowerShell Version: 4.0, 5.0
    OS Version: Windows 8.1, Server 2012 R2
    ===========================================================================
    Keywords vSphere, VM
    ===========================================================================

    .DESCRIPTION
    This Function report newly created and deleted VMs by Cluster.       

    .Example
    Get-NewAndRemovedVMs -ClusterName Cluster* | ft -AutoSize  

    .Example
    Get-NewAndRemovedVMs -ClusterName Cluster01 -Days 90

    .PARAMETER ClusterName
    Name or Wildcard of your vSphere Cluster Name(s) to report.

	.PARAMETER Summary
    Displays only a summary instead of teh whole report.

    .PARAMETER Day
    Range in Days to report.


#Requires PS -Version 4.0
#Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
#>

param(
    [Parameter(Mandatory=$True, ValueFromPipeline=$False, Position=0, HelpMessage = "Name or Wildcard of your vSphere Cluster Name to report")]
    [ValidateNotNullorEmpty()]
        [String]$ClusterName,
	[Parameter(Mandatory=$False, ValueFromPipeline=$False, Position=1, HelpMessage = "Displays only a summary")]
		[Switch]$Summary,
    [Parameter(Mandatory=$False, ValueFromPipeline=$False, Position=2, HelpMessage = "Range in Days to report")]
		[String]$Days = "30"
)
Begin {
	If (!(Get-Cluster -Name $ClusterName -ErrorAction SilentlyContinue)) {throw "No vSphere Cluster matching the Name '$ClusterName' found."}
    function Get-VIEventPlus {
	 
	param(
		[VMware.VimAutomation.ViCore.Impl.V1.Inventory.InventoryItemImpl[]]$Entity,
		[string[]]$EventType,
		[DateTime]$Start,
		[DateTime]$Finish = (Get-Date),
		[switch]$Recurse,
		[string[]]$User,
		[Switch]$System,
		[string]$ScheduledTask,
		[switch]$FullMessage = $false,
		[switch]$UseUTC = $false
	)

	process {
		$eventnumber = 100
		$events = @()
		$eventMgr = Get-View EventManager
		$eventFilter = New-Object VMware.Vim.EventFilterSpec
		$eventFilter.disableFullMessage = ! $FullMessage
		$eventFilter.entity = New-Object VMware.Vim.EventFilterSpecByEntity
		$eventFilter.entity.recursion = &{if($Recurse){"all"}else{"self"}}
		$eventFilter.eventTypeId = $EventType
		if($Start -or $Finish){
			$eventFilter.time = New-Object VMware.Vim.EventFilterSpecByTime
			if($Start){
				$eventFilter.time.beginTime = $Start
			}
			if($Finish){
				$eventFilter.time.endTime = $Finish
			}
		}
		if($User -or $System){
			$eventFilter.UserName = New-Object VMware.Vim.EventFilterSpecByUsername
			if($User){
				$eventFilter.UserName.userList = $User
			}
			if($System){
				$eventFilter.UserName.systemUser = $System
			}
		}
		if($ScheduledTask){
			$si = Get-View ServiceInstance
			$schTskMgr = Get-View $si.Content.ScheduledTaskManager
			$eventFilter.ScheduledTask = Get-View $schTskMgr.ScheduledTask |
			where {$_.Info.Name -match $ScheduledTask} |
			Select -First 1 |
			Select -ExpandProperty MoRef
		}
		if(!$Entity){
			$Entity = @(Get-Folder -NoRecursion)
		}
		$entity | %{
			$eventFilter.entity.entity = $_.ExtensionData.MoRef
			$eventCollector = Get-View ($eventMgr.CreateCollectorForEvents($eventFilter))
			$eventsBuffer = $eventCollector.ReadNextEvents($eventnumber)
			while($eventsBuffer){
				$events += $eventsBuffer
				$eventsBuffer = $eventCollector.ReadNextEvents($eventnumber)
			}
			$eventCollector.DestroyCollector()
		}
		if (-not $UseUTC)
		{
			$events | % { $_.createdTime = $_.createdTime.ToLocalTime() }
		}
		
		$events
	}
}
}

process {
    If ($Summary) {
		$output = $sortedResult | where {$_.Cluster -like $ClusterName}
		$Report = [PSCustomObject] @{
							Created 	= (Get-VIEventPlus -Start ((get-date).adddays(-$Days)) -EventType @("VmCreatedEvent") | where {$_.ComputeResource.Name -like $ClusterName}).count
							Cloned 		= (Get-VIEventPlus -Start ((get-date).adddays(-$Days)) -EventType @("VmBeingClonedEvent") | where {$_.ComputeResource.Name -like $ClusterName}).count
							Deployed 	= (Get-VIEventPlus -Start ((get-date).adddays(-$Days)) -EventType @("VmBeingDeployedEvent") | where {$_.ComputeResource.Name -like $ClusterName}).count
							Removed 	= (Get-VIEventPlus -Start ((get-date).adddays(-$Days)) -EventType @("VmRemovedEvent") | where {$_.ComputeResource.Name -like $ClusterName}).count

						}
		$Report
	}
	else {
		$result = Get-VIEventPlus -Start ((get-date).adddays(-$Days)) -EventType @("VmCreatedEvent", "VmBeingClonedEvent", "VmBeingDeployedEvent","VmRemovedEvent")
		$sortedResult = $result | Select CreatedTime, @{N='Cluster';E={$_.ComputeResource.Name}}, @{Name="VMName";Expression={$_.vm.name}}, UserName, @{N='Type';E={$_.GetType().Name}}, FullFormattedMessage | Sort CreatedTime
		$sortedResult | where {$_.Cluster -like $ClusterName}
	}
	
}
}