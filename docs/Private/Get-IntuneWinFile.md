# Get-IntuneWinFile

## SYNOPSIS
This function returns the encrypted intunewin file from inside the outer intunewin archive

## SYNTAX

```
Get-IntuneWinFile [-SourceFile] <String> [[-FileName] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
This function returns the encrypted intunewin file from inside the outer intunewin archive

## EXAMPLES

### EXAMPLE 1
```
Get-IntuneWinFile -SourceFile Package.intunewin -FileName 'IntunePackage.intunewin'
```

## PARAMETERS

### -SourceFile
The source intunewin file (outer archive not the encrypted one)

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

### -FileName
The filename for the internal encrypted intunewin file

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: IntunePackage.intunewin
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

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

### This function returns the IntunePackage.intunewin from
## NOTES
NAME: Get-IntuneWinFile

## RELATED LINKS
