---
external help file: IntuneGraph-help.xml
Module Name: IntuneGraph
online version:
schema: 2.0.0
---

# New-DetectionRule

## SYNOPSIS
This function is used to create new detection rules for a Win32 Application in Microsoft Intune

## SYNTAX

### PowerShell
```
New-DetectionRule [-PowerShell] -ScriptFile <String> [-EnforceSignatureCheck <Boolean>] [-RunAs32Bit <Boolean>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### MSI
```
New-DetectionRule [-MSI] -MSIProductCode <String> [-MSIProductVersionOperator <String>]
 [-MSIProductVersion <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### File
```
New-DetectionRule [-File] -Path <String> -FileOrFolderName <String> -FileDetectionType <String>
 [-FileDetectionOperator <String>] [-FileDetectionValue <String>] [-Check32BitOn64System <Boolean>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Registry
```
New-DetectionRule [-Registry] -RegistryKeyPath <String> -RegistryDetectionType <String>
 [-RegistryDetectionOperator <String>] [-RegistryValueName <String>] [-RegistryDetectionValue <String>]
 [-Check32BitRegOn64System <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function is used to create new detection rules for a Win32 Application in Microsoft Intune
The options are Powershell, MSI, File or, Registry

## EXAMPLES

### EXAMPLE 1
```
New-DetectionRule -PowerShell -ScriptFile detection.ps1 -EnforceSignatureCheck $false -RunAs32Bit $false
```

### EXAMPLE 2
```
New-DetectionRule -MSI -MSIProductCode
```

### EXAMPLE 3
```
New-DetectionRule -File -Path 'C:\Program Files\' -FileOrFolderName 'FolderToDetect' -FileDetectionType exists -Check32BitOn64System False
```

### EXAMPLE 4
```
New-DetectionRule -Registry -RegistryKeyPath -RegistryDetectionType string -RegistryValueName 'value' -Check32BitRegOn64System False
```

## PARAMETERS

### -PowerShell
Switch to select PowerShell detection rule

```yaml
Type: SwitchParameter
Parameter Sets: PowerShell
Aliases:

Required: True
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSI
Switch to select MSI detection rule

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

### -File
Switch to select File detection rule

```yaml
Type: SwitchParameter
Parameter Sets: File
Aliases:

Required: True
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Registry
Switch to select Registry detection rule

```yaml
Type: SwitchParameter
Parameter Sets: Registry
Aliases:

Required: True
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptFile
The path to the PowerShell detection script file

```yaml
Type: String
Parameter Sets: PowerShell
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnforceSignatureCheck
A value indicating whether signature check is enforced

```yaml
Type: Boolean
Parameter Sets: PowerShell
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RunAs32Bit
A value indicating whether this script should run as 32-bit

```yaml
Type: Boolean
Parameter Sets: PowerShell
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSIProductCode
The product code of Win32 Line of Business (LoB) app

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

### -MSIProductVersionOperator
The operator to detect product version

```yaml
Type: String
Parameter Sets: MSI
Aliases:

Required: False
Position: Named
Default value: NotConfigured
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSIProductVersion
The product version of Win32 Line of Business (LoB) app

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

### -Path
The file or folder path to detect Win32 Line of Business (LoB) app

```yaml
Type: String
Parameter Sets: File
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileOrFolderName
The file or folder name to detect Win32 Line of Business (LoB) app

```yaml
Type: String
Parameter Sets: File
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileDetectionType
The file system detection type

```yaml
Type: String
Parameter Sets: File
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileDetectionOperator
The operator for file or folder detection

```yaml
Type: String
Parameter Sets: File
Aliases:

Required: False
Position: Named
Default value: NotConfigured
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileDetectionValue
The file or folder detection value

```yaml
Type: String
Parameter Sets: File
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Check32BitOn64System
A value indicating whether this file or folder is for checking 32-bit app on 64-bit system

```yaml
Type: Boolean
Parameter Sets: File
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RegistryKeyPath
The registry key path to detect Win32 Line of Business (LoB) app

```yaml
Type: String
Parameter Sets: Registry
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RegistryDetectionType
The registry data detection type

```yaml
Type: String
Parameter Sets: Registry
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RegistryDetectionOperator
The operator for registry data detection

```yaml
Type: String
Parameter Sets: Registry
Aliases:

Required: False
Position: Named
Default value: NotConfigured
Accept pipeline input: False
Accept wildcard characters: False
```

### -RegistryValueName
The registry value name

```yaml
Type: String
Parameter Sets: Registry
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RegistryDetectionValue
The registry detection value

```yaml
Type: String
Parameter Sets: Registry
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Check32BitRegOn64System
A value indicating whether this registry path is for checking 32-bit app on 64-bit system

```yaml
Type: String
Parameter Sets: Registry
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
Determines how PowerShell responds to progress updates generated by a script, cmdlet, or provider, such as the progress bars generated by the Write-Progress cmdlet.

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. No objects can be piped into this function
## OUTPUTS

### This function outputs a new detection rule for a Win32 Application in Microsoft Intune
## NOTES
NAME: New-DetectionRule

## RELATED LINKS
