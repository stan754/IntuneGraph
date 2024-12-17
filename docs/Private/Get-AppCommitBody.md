# Get-AppCommitBody

## SYNOPSIS
This function returns a committedContentVersion body

## SYNTAX

```
Get-AppCommitBody [-ContentVersionId] <String> [-LobType] <String> [<CommonParameters>]
```

## DESCRIPTION
This function returns a committedContentVersion body

## EXAMPLES

### EXAMPLE 1
```
Get-AppCommitBody -ContentVersionId $id -LobType "microsoft.graph.win32LobApp"
```

## PARAMETERS

### -ContentVersionId
The content version ID

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

### -LobType
The LOB type

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. No objects can be piped into this function
## OUTPUTS

### This function returns the committedContentVersion body
## NOTES
NAME: Get-AppCommitBody

## RELATED LINKS
