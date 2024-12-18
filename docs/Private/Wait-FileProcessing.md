# Wait-FileProcessing

## SYNOPSIS
This function waits for a file to finish processing a specified stage

## SYNTAX
```powershell
Wait-FileProcessing [-FileUri] <String> [-Stage] <String> [<CommonParameters>]
```

## DESCRIPTION
This function waits for a file to finish processing a specified stage

## EXAMPLES

### EXAMPLE 1
```powershell
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

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### This function outputs the mobileAppContentFile body when the state is success

## NOTES
NAME: Wait-FileProcessing

## RELATED LINKS

