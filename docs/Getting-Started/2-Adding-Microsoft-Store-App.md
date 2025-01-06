# Adding Microsoft Store Application
On this page you will learn how to add a Microsoft Store Application to Microsoft Intune.
To add a Microsoft Store Application the only thing you need is the package Identifier.

!!! info
    The package identifier looks like `9wzdncrfj3tj` this can be either capitalized or lowercase like this.
    This can be found on the [Microsoft Store](https://apps.microsoft.com) website in the URL

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

### 2. Upload to Intune
Since the Microsoft Store Applications are already well integrated into Intune the only necessary information for a package is the package Id.
Because of this the only thing you have to do to add an application is this.

```Powershell
Add-MSStoreApp -PackageIdentifier '9NCBCSZSJRSB'
```

If the default information is not what you wanted you can also provide more flags to customize this.

```Powershell
$Params = @{
    PackageIdentifier = '9NCBCSZSJRSB'
    DisplayName = 'Spotify'
    Description = 'Play music using Spotify'
}

Add-MSStoreApp @Params
```