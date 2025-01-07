function Add-Win32ApplicationAssignment {
    <#
    .SYNOPSIS
        This function is used to add an assignment to a win32 application in Microsoft Intune
    .DESCRIPTION
        This function is used to add an assignment to a win32 application in Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module
    .EXAMPLE
        Add-Win32ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14 -Group -GroupID a3d3387d-61b8-4c5c-8037-c6bde1213d7e
    .EXAMPLE
        Add-Win32ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14 -AllUsers
    .EXAMPLE
        Add-Win32ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14 -AllDevices
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        None. This function outputs nothing
    .NOTES
        NAME: Add-Win32ApplicationAssignment
    #>
    [CmdletBinding()]
    param (
        # The application ID in Intune
        [Parameter(Mandatory = $true)]
        [guid] $IntuneID,
        # The Install intent for the assignment
        [Parameter(Mandatory = $true)]
        [ValidateSet('available', 'required', 'uninstall', 'availableWithoutEnrollment')]
        [string] $Intent,
        # Set type of assignment to group
        [Parameter(Mandatory = $true, ParameterSetName = "Group")]
        [switch] $Group,
        # The group ID in Entra
        [Parameter(Mandatory = $true, ParameterSetName = "Group")]
        [guid] $GroupID,
        # Set group to exclude instead of include
        [Parameter(Mandatory = $false, ParameterSetName = "Group")]
        [switch] $ExcludeGroup,
        # Set type of assignment to all users
        [Parameter(Mandatory = $true, ParameterSetName = "AllUsers")]
        [switch] $AllUsers,
        # Set type of assignment to all devices
        [Parameter(Mandatory = $true, ParameterSetName = "AllDevices")]
        [switch] $AllDevices,
        # The notification status for this app assignment
        [Parameter(Mandatory = $false)]
        [ValidateSet('showAll', 'showReboot', 'hideAll')]
        [string] $Notifications = 'showAll',
        # Enable restart grace period
        [Parameter(Mandatory = $false)]
        [switch] $EnableGracePeriod,
        # The number of minutes to wait before restarting the device after an app installation
        [Parameter(Mandatory = $false)]
        [ValidateNotNull()]
        [int] $GracePeriod,
        # The number of minutes before the restart time to display the countdown dialog for pending restarts
        [Parameter(Mandatory = $false)]
        [ValidateNotNull()]
        [int] $GracePeriodCountdown,
        # The number of minutes to snooze the restart notification dialog when the snooze button is selected
        [Parameter(Mandatory = $false)]
        [int] $GracePeriodNotification = 0,
        # Enable installation deadline
        [Parameter(Mandatory = $false)]
        [switch] $EnableInstallationDeadline,
        # Whether the local device time or UTC time should be used when determining the deadline times
        [Parameter(Mandatory = $false)]
        [ValidateNotNull()]
        [bool] $InstallationDeadlineLocalTime,
        # The time at which the app should be installed
        [Parameter(Mandatory = $false)]
        [ValidateNotNull()]
        [System.DateTimeOffset] $InstallationStartDateTime,
        # The time at which the app should be installed
        [Parameter(Mandatory = $false)]
        [ValidateNotNull()]
        [System.DateTimeOffset] $InstallationDeadlineDateTime
    )

    if ($EnableGracePeriod) {
        if (-not $GracePeriod -or -not $GracePeriodCountdown) {
            throw "You must specify GracePeriod and GracePeriodCountdown when EnableGracePeriod is set."
        }

        $restartSettings = @{
            "@odata.type"                              = "microsoft.graph.win32LobAppRestartSettings"
            gracePeriodInMinutes                       = $GracePeriod
            countdownDisplayBeforeRestartInMinutes     = $GracePeriodCountdown
        }

        if($GracePeriodNotification -ne 0) {
            $restartSettings['restartNotificationSnoozeDurationInMinutes'] = "test"
        }
    }
    else {
        $restartSettings = $null
    }
    
    if ($EnableInstallationDeadline) {
        if ($Intent -eq 'available') {
            if (-not $InstallationStartDateTime) {
                throw "You must specify InstallationStartDateTime when EnableInstallationDeadline is set."
            }
            $installTimeSettings = @{
                "@odata.type"    = "#microsoft.graph.mobileAppInstallTimeSettings"
                useLocalTime     = $false
                startDateTime    = $InstallationStartDateTime
            }
        } else {
            if (-not $PSBoundParameters.ContainsKey('InstallationDeadlineLocalTime') -or -not $InstallationStartDateTime -or -not $InstallationDeadlineDateTime) {
                throw "You must specify InstallationDeadlineLocalTime, InstallationStartDateTime, and InstallationDeadlineDateTime when EnableInstallationDeadline is set."
            }
            $installTimeSettings = @{
                "@odata.type"    = "#microsoft.graph.mobileAppInstallTimeSettings"
                useLocalTime     = $InstallationDeadlineLocalTime
                startDateTime    = $InstallationStartDateTime
                deadlineDateTime = $InstallationDeadlineDateTime
            }
        }
    }
    else {
        $installTimeSettings = $null
    }
    
    if ($PSCmdlet.ParameterSetName -eq 'Group') {
        if ($ExcludeGroup) {
            $assignmentTarget = @{
                "@odata.type" = "#microsoft.graph.exclusionGroupAssignmentTarget"
                groupId       = $GroupID
            }
        }
        else {
            $assignmentTarget = @{
                "@odata.type" = "#microsoft.graph.groupAssignmentTarget"
                groupId       = $GroupID
            }
        }
    }
    elseif ($PSCmdlet.ParameterSetName -eq 'AllUsers') {
        $assignmentTarget = @{
            "@odata.type" = "#microsoft.graph.allUsersAssignmentTarget"
        }
    }
    elseif ($PSCmdlet.ParameterSetName -eq 'AllDevices') {
        $assignmentTarget = @{
            "@odata.type" = "#microsoft.graph.allDevicesAssignmentTarget"
        }
    }

    $body = @{
        "@odata.type" = "#microsoft.graph.mobileAppAssignment"
        intent        = $Intent
        target        = $assignmentTarget
        settings      = @{
            "@odata.type"       = "#microsoft.graph.win32LobAppAssignmentSettings"
            notifications       = $Notifications
            restartSettings     = $restartSettings
            installTimeSettings = $installTimeSettings
        }
    } | ConvertTo-Json -Depth 10

    Invoke-PostRequest -CollectionPath "mobileApps/$IntuneID/assignments" -Body $body
}