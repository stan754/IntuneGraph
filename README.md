![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/IntuneGraph?style=for-the-badge)
![GitHub License](https://img.shields.io/github/license/stan754/IntuneGraph?style=for-the-badge)
![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/IntuneGraph?style=for-the-badge)


# IntuneGraph
Powershell Module to upload intunewin to Intune.

> [!IMPORTANT]  
> This module is a community project and might not work for everyone!
> 
> The sourcecode is open but make sure to test the module before implementing this somewhere there is **NO** support available

## Getting Started
To run from the source code clone or download this repo to your local machine.

### Prerequisites
The only dependency for this module is the `Microsoft.Graph.Authentication` Powershell module.
Which can be installed using:

```Powershell
Install-Module Microsoft.Graph.Authentication -Scope CurrentUser -Repository PSGallery -Force
```

### Import
> [!TIP]
> The module can now also be installed from PSGallery!
> ```Powershell
> Install-Module IntuneGraph -Scope CurrentUser -Repository PSGallery -Force
> ```

After installing the prerequisites the module should be ready to use and can be imported using:

```Powershell
Import-Module '.\IntuneGraph'
```

## Usage
To start using the module import it into a script and run:

```Powershell
Connect-MgGraph -Scopes DeviceManagementApps.ReadWrite.All
```

After connecting you can start uploading to Intune like this:

```Powershell
Import-Module '.\IntuneGraph'

$SourceFile = "C:\Path\To\Package.intunewin"

$FileRule = Get-DetectionRule -File -Path "C:\Program Files\Application" -FileOrFolderName "application.exe" -FileDetectionType exists -check32BitOn64System False

$ReturnCodes = Get-DefaultReturnCode

Add-Win32Lob `
  -SourceFile "$SourceFile" `
  -publisher "Publisher name" `
  -description "Short description" `
  -detectionRules @($FileRule) `
  -returnCodes $ReturnCodes
  -installCmdLine "powershell.exe .\install.ps1" `
  -uninstallCmdLine "powershell.exe .\uninstall.ps1"
```

## Why
When I was looking for a solution to upload intunewin files to Intune I could not find any good explanation.
The only code and documentation that I found online had dependencies on deprecated modules which is not a good start.
With this module I hope to bundle everything into a simple module.

## License
This code is licensed under the MIT License.
See the `LICENSE` file for the license.

This code is based on the sample code provided by Microsoft:
- [Application_LOB_Add.ps1](https://github.com/microsoftgraph/powershell-intune-samples/blob/master/LOB_Application/Application_LOB_Add.ps1)

See the `LICENSE-MIT-MICROSOFT` file for the original license.