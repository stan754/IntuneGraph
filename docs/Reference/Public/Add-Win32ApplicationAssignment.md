---
tags:
- Public
---
# Add-Win32ApplicationAssignment

## SYNOPSIS
This function is used to add an assignment to a win32 application in Microsoft Intune

## SYNTAX
```powershell
Add-Win32ApplicationAssignment -IntuneID <Guid> -Intent <String> -Group -GroupID <Guid> [-ExcludeGroup] [-Notifications <String>] [-EnableGracePeriod] [-GracePeriod <Int32>] [-GracePeriodCountdown <Int32>] [-GracePeriodNotification <Int32>] [-EnableInstallationDeadline] [-InstallationDeadlineLocalTime <Boolean>] [-InstallationStartDateTime <DateTimeOffset>] [-InstallationDeadlineDateTime <DateTimeOffset>] [<CommonParameters>]

Add-Win32ApplicationAssignment -IntuneID <Guid> -Intent <String> -AllUsers [-Notifications <String>] [-EnableGracePeriod] [-GracePeriod <Int32>] [-GracePeriodCountdown <Int32>] [-GracePeriodNotification <Int32>] [-EnableInstallationDeadline] [-InstallationDeadlineLocalTime <Boolean>] [-InstallationStartDateTime <DateTimeOffset>] [-InstallationDeadlineDateTime <DateTimeOffset>] [<CommonParameters>]

Add-Win32ApplicationAssignment -IntuneID <Guid> -Intent <String> -AllDevices [-Notifications <String>] [-EnableGracePeriod] [-GracePeriod <Int32>] [-GracePeriodCountdown <Int32>] [-GracePeriodNotification <Int32>] [-EnableInstallationDeadline] [-InstallationDeadlineLocalTime <Boolean>] [-InstallationStartDateTime <DateTimeOffset>] [-InstallationDeadlineDateTime <DateTimeOffset>] [<CommonParameters>]
```

## DESCRIPTION
This function is used to add an assignment to a win32 application in Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module

## EXAMPLES

### EXAMPLE 1
```powershell
Add-Win32ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14
```

## PARAMETERS

### -IntuneID
The application ID in Intune

```yaml
Type: Guid
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Intent
The Install intent for the assignment

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Valid Values: ['available', 'required', 'uninstall', 'availableWithoutEnrollment']

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
Set type of assignment to group

```yaml
Type: SwitchParameter
Parameter Sets: Group
Aliases: 

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupID
The group ID in Entra

```yaml
Type: Guid
Parameter Sets: Group
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeGroup
Set group to exclude instead of include

```yaml
Type: SwitchParameter
Parameter Sets: Group
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllUsers
Set type of assignment to all users

```yaml
Type: SwitchParameter
Parameter Sets: AllUsers
Aliases: 

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllDevices
Set type of assignment to all devices

```yaml
Type: SwitchParameter
Parameter Sets: AllDevices
Aliases: 

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Notifications
The notification status for this app assignment

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Valid Values: ['showAll', 'showReboot', 'hideAll']

Required: False
Position: Named
Default value: showAll
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableGracePeriod
Enable restart grace period

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -GracePeriod
The number of minutes to wait before restarting the device after an app installation

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -GracePeriodCountdown
The number of minutes before the restart time to display the countdown dialog for pending restarts

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -GracePeriodNotification
The number of minutes to snooze the restart notification dialog when the snooze button is selected

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableInstallationDeadline
Enable installation deadline

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallationDeadlineLocalTime
Whether the local device time or UTC time should be used when determining the deadline times

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallationStartDateTime
The time at which the app should be installed

```yaml
Type: DateTimeOffset
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallationDeadlineDateTime
The time at which the app should be installed

```yaml
Type: DateTimeOffset
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### None. This function outputs nothing

## NOTES
NAME: Add-Win32ApplicationAssignment

## RELATED LINKS

