---
tags:
- Private
---
# Get-Win32AppBody

## SYNOPSIS
This function returns a Win32 application body for the Microsoft Graph API

## SYNTAX
```powershell
Get-Win32AppBody [-MSI] -DisplayName <String> -Publisher <String> -Description <String> -Filename <String> -SetupFileName <String> -InstallScope <String> [-DeviceRestartBehavior <String>] -MSIPackageType <String> -MSIProductCode <String> [-MSIProductName <String>] -MSIProductVersion <String> [-MSIPublisher <String>] -MSIRequiresReboot <Boolean> -MSIUpgradeCode <String> [-AllowUninstall <Boolean>] [<CommonParameters>]

Get-Win32AppBody [-EXE] -DisplayName <String> -Publisher <String> -Description <String> -Filename <String> -SetupFileName <String> -InstallScope <String> [-DeviceRestartBehavior <String>] -InstallCommandLine <String> -UninstallCommandLine <String> [-AllowUninstall <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
This function returns a Win32 application body for the Microsoft Graph API

## EXAMPLES

### EXAMPLE 1
```powershell
Get-Win32AppBody `
    -MSI `
    -DisplayName "$DisplayName" `
    -Publisher "$Publisher" `
    -Description $Description `
    -Filename $SourceFileName `
    -SetupFileName "$SetupFileName" `
    -InstallScope $installScope `
    -MSIPackageType $MsiPackageType `
    -MSIProductCode $MsiProductCode `
    -MSIProductName $DisplayName `
    -MSIProductVersion $MsiProductVersion `
    -MSIPublisher $MsiPublisher `
    -MSIRequiresReboot $MsiRequiresReboot `
    -MSIUpgradeCode $MsiUpgradeCode
```

### EXAMPLE 2
```powershell
Get-Win32AppBody `
    -EXE `
    -DisplayName "$DisplayName" `
    -Publisher "$Publisher" `
    -Description $Description `
    -Filename $SourceFileName `
    -SetupFileName "$SetupFileName" `
    -InstallExperience $installExperience `
    -InstallCommandLine $InstallCmdLine `
    -UninstallCommandLine $uninstallcmdline
```

## PARAMETERS

### -MSI
Switch to select MSI

```yaml
Type: SwitchParameter
Parameter Sets: MSI
Aliases: 

Required: True
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EXE
Switch to select EXE

```yaml
Type: SwitchParameter
Parameter Sets: EXE
Aliases: 

Required: True
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayName
The display name to show in Microsoft Intune

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Publisher
The publisher name to show in Microsoft Intune

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
The description to show in Microsoft Intune

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filename
The file name of the intunewin to show in Microsoft Intune

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetupFileName
The setup file name

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallScope
The install scope of the application

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Valid Values: ['system', 'user']

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DeviceRestartBehavior
Device restart behavior

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Valid Values: ['basedOnReturnCode', 'allow', 'suppress', 'force']

Required: False
Position: Named
Default value: suppress
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallCommandLine
The install command for EXE

```yaml
Type: String
Parameter Sets: EXE
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UninstallCommandLine
The uninstall command for EXE

```yaml
Type: String
Parameter Sets: EXE
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSIPackageType
The MSI package type

```yaml
Type: String
Parameter Sets: MSI
Aliases: 
Valid Values: ['perMachine', 'perUser', 'dualPurpose']

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSIProductCode
The MSI product code

```yaml
Type: String
Parameter Sets: MSI
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSIProductName
The MSI product name

```yaml
Type: String
Parameter Sets: MSI
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSIProductVersion
The MSI product version

```yaml
Type: String
Parameter Sets: MSI
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSIPublisher
The MSI publisher

```yaml
Type: String
Parameter Sets: MSI
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSIRequiresReboot
Whether the MSI app requires the machine to reboot to complete installation

```yaml
Type: Boolean
Parameter Sets: MSI
Aliases: 

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSIUpgradeCode
The MSI upgrade code

```yaml
Type: String
Parameter Sets: MSI
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowUninstall
Allow an application to be uninstallable from the Company Portal

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### This function returns the application body

## NOTES
NAME: Get-Win32AppBody

## RELATED LINKS

