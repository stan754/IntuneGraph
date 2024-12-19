# Using the module
To start using the module import it into a script and run:

```Powershell
Connect-MgGraph -Scopes DeviceManagementApps.ReadWrite.All
```

After connecting you can start uploading to Intune like this:

```Powershell
Import-Module IntuneGraph

$SourceFile = "C:\Path\To\Package.intunewin"

$FileRule = Get-DetectionRule -File -Path "C:\Program Files\Application" -FileOrFolderName "application.exe" -FileDetectionType exists -check32BitOn64System False

$ReturnCodes = Get-DefaultReturnCode

Add-Win32Lob `
  -SourceFile "$SourceFile" `
  -publisher "Publisher name" `
  -description "Short description" `
  -detectionRules @($FileRule) `
  -returnCodes $ReturnCodes `
  -installCmdLine "powershell.exe .\install.ps1" `
  -uninstallCmdLine "powershell.exe .\uninstall.ps1"
```