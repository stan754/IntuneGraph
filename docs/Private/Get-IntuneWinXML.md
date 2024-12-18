# Get-IntuneWinXML

## SYNOPSIS
This function returns the detection.xml from inside the outer intunewin archive

## SYNTAX
```powershell
Get-IntuneWinXML [-SourceFile] <String> [[-FileName] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function returns the detection.xml from inside the outer intunewin archive

## EXAMPLES

### EXAMPLE 1
```powershell
Get-IntuneWinXML -SourceFile Package.intunewin -FileName 'detection.xml'
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
The filename for the xml to read

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: detection.xml
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### This function returns the detection.xml from the intunewin archive

## NOTES
NAME: Get-IntuneWinXML

## RELATED LINKS

