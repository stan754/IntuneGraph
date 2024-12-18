---
tags:
- Public
---
# Add-Win32Lob

## SYNOPSIS
This function is used to upload a Win32 Application to Microsoft Intune

## SYNTAX
```powershell
Add-Win32Lob [-SourceFile] <String> [-DisplayName <String>] [-Publisher] <String> [-Description] <String> [-DetectionRules] <Array> [-ReturnCodes] <Array> [[-InstallCmdLine] <String>] [[-UninstallCmdLine] <String>] [[-installExperience] <String>] [-Sleep <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function is used to upload a Win32 Application to Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module

## EXAMPLES

### EXAMPLE 1
```powershell
Add-Win32Lob -SourceFile "C:\Packages\package.intunewin" `
    -Publisher "Microsoft" `
    -Description "Package description" `
    -DetectionRules @($fileRule) `
    -ReturnCodes $defaultCodes
# Adds a package to Microsoft Intune with just the required parameters, for anything that's not an MSI the installcmd and uninstallcmd
```

### EXAMPLE 2
```powershell
Add-Win32Lob -SourceFile "C:\Packages\package.intunewin" `
    -Publisher "Microsoft" `
    -Description "Package description" `
    -DetectionRules @($fileRule) `
    -ReturnCodes $defaultCodes `
    -InstallCmdLine "setup.exe" `
    -UninstallCmdLine "uninstall.exe"
# Adds a package to Microsoft Intune with just the required parameters for an exe installer
```

## PARAMETERS

### -SourceFile
The intunewin sourcefile created with the IntuneWinAppUtil.exe

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayName
The DisplayName for the application in Microsoft Intune
This parameter is optional and will be filled with information from the detection.xml otherwise

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Publisher
The Publisher for the application in Microsoft Intune

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
The Description for the application in Microsoft Intune

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DetectionRules
An array of detection rules for the application needs a minimum of 1

```yaml
Type: Array
Parameter Sets: (All)
Aliases: 

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReturnCodes
The returncodes for the application in Microsoft Intune
To use the default returncodes you can get these with Get-DefaultReturnCodes

```yaml
Type: Array
Parameter Sets: (All)
Aliases: 

Required: True
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallCmdLine
The install command to install the application

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UninstallCmdLine
The uninstall command to uninstall the application

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -installExperience
The installscope for the application this can be either system or user
By default this is set to system

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 9
Default value: system
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sleep
The time the function sleeps after creating and uploading the application to make sure it's available
By default this is 30 seconds

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 30
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### This function outputs the application body received from the Graph API as an object

## NOTES
NAME: Add-Win32LOB

## RELATED LINKS

