---
tags:
- Private
---
# Get-AppFileBody

## SYNOPSIS
This function returns the detection.xml from inside the outer intunewin archive

## SYNTAX
```powershell
Get-AppFileBody [-Name] <String> [-Size] <Int64> [-SizeEncrypted] <Int64> [[-Manifest] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function returns the detection.xml from inside the outer intunewin archive

## EXAMPLES

### EXAMPLE 1
```powershell
Get-AppFileBody -Name IntunePackage.intunewin -Size 522 -SizeEncrypted (Get-Item "package.intunewin").Length
```

## PARAMETERS

### -Name
The file name

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Size
The size of the file prior to encryption

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SizeEncrypted
The size of the file after encryption

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Manifest
The manifest information

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### This function returns a mobileAppContentFile body

## NOTES
NAME: Get-AppFileBody

## RELATED LINKS

