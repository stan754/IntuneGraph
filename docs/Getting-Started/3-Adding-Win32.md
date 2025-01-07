# Adding Win32 Application
On this page you will learn how to upload a Win32 application to Microsoft Intune.
For this we will have to package the application as an intunewin file which is the official way to package Win32 applications supported by microsoft.

## Requirements
Make sure you have everything ready before uploading the Win32 application.

- Win32 packaged as [.intunewin](https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-prepare) file.
- Install command (if not MSI)
- Uninstall command (if not MSI)
- Required metadata
- Detection rule/Detection script

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

### 2. Get Return Codes
#### Default Codes
In intune the application can request to reboot or report success using the return codes.
By default on the web interface it gives you some default return codes which are:

| Code | Type        |
| ---- | ----------- |
| 0    | Success     |
| 1707 | Success     |
| 3010 | Soft reboot |
| 1641 | Hard reboot |
| 1618 | Retry       |

To just use these return codes you can use:

```Powershell
$ReturnCodes = Get-DefaultReturnCode
```

#### Custom Codes
If your application requires custom return codes or extra ones you can create those using:

```Powershell
$ReturnCodes = @()
$ReturnCodes += Get-ReturnCode -ReturnCode 1234 -Type 'success'
$ReturnCodes += Get-ReturnCode -ReturnCode 4321 -Type 'hardReboot'
$ReturnCodes += Get-ReturnCode -ReturnCode 22 -Type 'softReboot'
```

### 3. Get Detection Rules
For a Win32 application to be available Intune should be able to detect if it's successfully installed or if it is already installed.
To do this we need some [detection rules](https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-add#step-4-detection-rules), the possible types of detection rules are:

- PowerShell Detection Script
- MSI ProductCode Detection
- File Detection
- Registry Detection

For your application you only need **one** detection rule.
When you got one you can move on to step 4.

#### Script Detection Rule
For us to use a PowerShell detection script we can save it and it's settings to a variable like this.

So for example I have a detection script called `detect-application.ps1` which should run on our client machines as a 64 bit process and doesn't need a signature check.

```Powershell
$Params = @{
    ScriptFile              = 'detect-application.ps1'
    EnforceSignatureCheck   = $false
    RunAs32Bit              = $false
}

$DetectionRule = Get-DetectionRule -PowerShell @Params
```

#### MSI ProductCode Detection Rule
To get a detection rule based on an MSI productcode we can use this:

```Powershell
$Params = @{
    MSIProductCode = '6f3281c7-acf2-40aa-8cbd-ef3c78a0bd82'
}

$DetectionRule = Get-DetectionRule -MSI @Params
```

#### File Detection Rule
Another option for detection is based on whether a file or folder exists or not, to do this we can do this:

```Powershell
$Params = @{
    Path                    = 'C:\Program Files\'
    FileOrFolderName        = 'FolderToDetect' 
    FileDetectionType       = 'exists'
    Check32BitOn64System    = $false
}

$DetectionRule = Get-DetectionRule -File @Params
```

#### Registry Detection Rule
The last type of detection rule is based on a registry key which can be done like this:

```Powershell
$Params = @{
    RegistryKeyPath = 'HKEY_LOCAL_MACHINE\SOFTWARE\SoftwareName'
    RegistryDetectionType = 'string'
    RegistryValueName = 'value'
    Check32BitRegOn64System = $false
}

$DetectionRule = Get-DetectionRule -Registry @Params
```

### 4. Uploading Intunewin
At this moment there are two possible types of intunewin packages.
One is the MSI based one which contains some information about the MSI this one doesn't require any install/uninstall commands.

And we have the more basic EXE/Script version which contains less information but does give more control about the way how to install software.

When using this module the difference between the two is barely noticable, only when you don't provide the install/uninstall commands but on the web interface you have to package it as an EXE/Script type if you want custom install commands.

By default the module will set as much information as possible based on the intunewin file, because of this it's not necessary to set a display name but it is recommended otherwise it will use the name of the intunewin file.

#### MSI Based Intunewin
```Powershell
$Params = @{
    SourceFile      = "C:\Packages\package.intunewin"
    DisplayName     = "Some Software Package"
    Publisher       = "Software Publisher"
    Description     = "Package description"
    DetectionRules  = $DetectionRule
    ReturnCodes     = $ReturnCodes
}

Add-Win32Lob @Params
```

#### EXE/Script Based Intunewin
```Powershell
$Params = @{
    SourceFile          = "C:\Packages\package.intunewin"
    DisplayName         = "Some Software Package"
    Publisher           = "Software Publisher"
    Description         = "Package description"
    InstallCmdLine      = "powershell.exe -windowstyle hidden -executionpolicy bypass -command .\install.ps1"
    UninstallCmdLine    = "powershell.exe -windowstyle hidden -executionpolicy bypass -command .\uninstall.ps1"
    DetectionRules      = $DetectionRule
    ReturnCodes         = $ReturnCodes
}

Add-Win32Lob @Params
```