function Get-NewVMs {
<#	
    .NOTES
    ===========================================================================
    Created by: Markus Kraus
    Twitter: @VMarkus_K
    Private Blog: mycloudrevolution.com
    ===========================================================================
    Changelog:  
    2016.12 ver 1.0 Base Release 
    ===========================================================================
    External Code Sources:  
    http://www.lucd.info/2013/03/31/get-the-vmotionsvmotion-history/
    ===========================================================================
    Tested Against Environment:
    vSphere Version: 5.5 U2
    PowerCLI Version: PowerCLI 6.3 R1, PowerCLI 6.5 R1
    PowerShell Version: 4.0, 5.0
    OS Version: Windows 8.1, Server 2012 R2
    ===========================================================================
    Keywords vSphere, VM
    ===========================================================================

    .DESCRIPTION
    This Function report newly created VMs by Cluster.       

    .Example
    Get-NewVMs -ClusterName Cluster* | ft -AutoSize  

    .Example
    Get-NewVMs -ClusterName Cluster01, Cluster02 -Days 60 | ft -AutoSize

    .PARAMETER ClusterName
    List or Wildcard of your vSphere Cluser Names to process.

    .PARAMETER Day
    Range to report.


#Requires PS -Version 4.0
#Requires -Modules VMware.VimAutomation.Core, @{ModuleName="VMware.VimAutomation.Core";ModuleVersion="6.3.0.0"}
#>

param(
    [Parameter(Mandatory=$True, ValueFromPipeline=$False, Position=0)]
        $ClusterName,
    [Parameter(Mandatory=$False, ValueFromPipeline=$False, Position=1)]
        [String]$Days = "30"
)
Begin {
    function Get-VIEventPlus {
    <#   
    .SYNOPSIS  Returns vSphere events    
    .DESCRIPTION The function will return vSphere events. With
    the available parameters, the execution time can be
    improved, compered to the original Get-VIEvent cmdlet. 
    .NOTES  Author:  Luc Dekens   
    .PARAMETER Entity
    When specified the function returns events for the
    specific vSphere entity. By default events for all
    vSphere entities are returned. 
    .PARAMETER EventType
    This parameter limits the returned events to those
    specified on this parameter. 
    .PARAMETER Start
    The start date of the events to retrieve 
    .PARAMETER Finish
    The end date of the events to retrieve. 
    .PARAMETER Recurse
    A switch indicating if the events for the children of
    the Entity will also be returned 
    .PARAMETER User
    The list of usernames for which events will be returned 
    .PARAMETER System
    A switch that allows the selection of all system events. 
    .PARAMETER ScheduledTask
    The name of a scheduled task for which the events
    will be returned 
    .PARAMETER FullMessage
    A switch indicating if the full message shall be compiled.
    This switch can improve the execution speed if the full
    message is not needed.   
    .EXAMPLE
    PS> Get-VIEventPlus -Entity $vm
    .EXAMPLE
    PS> Get-VIEventPlus -Entity $cluster -Recurse:$true
    #>
    
    param(
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.InventoryItemImpl[]]$Entity,
        [string[]]$EventType,
        [DateTime]$Start,
        [DateTime]$Finish = (Get-Date),
        [switch]$Recurse,
        [string[]]$User,
        [Switch]$System,
        [string]$ScheduledTask,
        [switch]$FullMessage = $false
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
        $Entity = @(Get-Folder -Name Datacenters)
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
        $events
    }
}
}

process {
    $result = Get-VIEventPlus -Entity (Get-Cluster -Name $ClusterName | Get-VM)  -Start ((get-date).adddays(-$Days)) -EventType @("VmCreatedEvent", "VmBeingClonedEvent", "VmBeingDeployedEvent")
    $result | Select CreatedTime, @{N='Cluster';E={$_.ComputeResource.Name}}, UserName, @{N='Type';E={$_.GetType().Name}}, FullFormattedMessage | Sort CreatedTime
}
}