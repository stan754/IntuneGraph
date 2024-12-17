# Wait-FileProcessing

## SYNOPSIS
This function waits for a file to finish processing a specified stage

## SYNTAX

```
Wait-FileProcessing [-FileUri] <String> [-Stage] <String> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
This function waits for a file to finish processing a specified stage

## EXAMPLES

### EXAMPLE 1
```
Wait-FileProcessing -FileUri "mobileApps/$appId/$LOBType/contentVersions/$contentVersionId/files/$fileId" -Stage "AzureStorageUriRequest"
```

## PARAMETERS

### -FileUri
The Microsoft Graph API Uri of the file

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

### -Stage
The stage to wait for to successfully complete

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

### This function outputs the mobileAppContentFile body when the state is success
## NOTES
NAME: Wait-FileProcessing

## RELATED LINKS
