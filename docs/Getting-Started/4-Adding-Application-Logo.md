# Adding Application Logo
You now know how to create an application in Intune.
The application should work but when distributing software using Company Portal it might be nice to also add a logo to the application.
This way the people trying to install the application can see an icon in the Company Portal

## Requirements
At this moment Microsoft Intune only supports `JPEG` and `PNG` images so make sure you have the application logo saved as one of those.

Also make sure you already have an application created in Intune. This can be either a Microsoft Store or Win32 application. For this you will need the application ID which can be found in Intune or as the output of creating an application.

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

### 2. Add Logo To Application
To add the logo to the application the only thing you have to do is:

```Powershell
$Params = @{
    ApplicationId   = 'a52b9681-ff59-4c69-bfce-8b4d28b56172'
    LogoPath        = './logo.png'
}

Update-ApplicationLogo @Params
```