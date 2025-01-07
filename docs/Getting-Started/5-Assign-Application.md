# Assign Aplication
Now after adding the application to intune and optionally adding a logo you can assign the application to users.

To do this there are 3 different options:

- Assign to specific group
- Assign to all users
- Assign to all devices

## Steps
### 1. Connect to Microsoft Graph
Just like for most other cmdlets in this module you will have to be authenticated to the Microsoft Graph API.
To check if you are already authenticated you can run:

```Powershell
Get-MgContext
```

If it returns some information about the tenant and the authenticated user or application you are successfully connected and can go to step 2.
If this returns nothing you are not yet authenticated to the Graph API.

To connect to the Graph API you can run this command for an interactive login prompt.
This is the preferred method for testing or ad-hoc commands, if you want to integrate it into a script or CI/CD pipeline it is recommended to use an app registration instead.

```Powershell
Connect-MgGraph -Scopes DeviceManagementApps.ReadWrite.All
```

### 2. Assign Application
#### Assign to All Users
```Powershell
$Params = @{
    IntuneId    = 'a45fc7ce-d87b-42d7-a6dc-47cb221addd7'
    Intent      = 'available' # (available, required, uninstall, availableWithoutEnrollment)
    AllUsers    = $true
}

Add-Win32ApplicationAssignment @Params
```

#### Assign to All Devices
```Powershell
$Params = @{
    IntuneId    = 'a45fc7ce-d87b-42d7-a6dc-47cb221addd7'
    Intent      = 'available' # (available, required, uninstall, availableWithoutEnrollment)
    AllDevices  = $true
}

Add-Win32ApplicationAssignment @Params
```

#### Assign to Specific Group
```Powershell
$Params = @{
    IntuneId    = 'a45fc7ce-d87b-42d7-a6dc-47cb221addd7'
    Intent      = 'available' # (available, required, uninstall, availableWithoutEnrollment)
    Group       = $true
    GroupID     = '6b7f21ed-3475-412f-bc55-128618d38001'
}

Add-Win32ApplicationAssignment @Params
```