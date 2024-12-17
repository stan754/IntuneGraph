# Add-FileToAzureStorage

## SYNOPSIS
This function uploads a file to an Azure Storage Blob using a Sas Uri

## SYNTAX

```
Add-FileToAzureStorage [-SasUri] <String> [-FilePath] <String> [-FileUri] <String>
 [[-AzureStorageUploadChunkSizeInMb] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function uploads a file to an Azure Storage Blob using a Sas Uri

## EXAMPLES

### EXAMPLE 1
```
Add-FileToAzureStorage -SasUri $file.azureStorageUri -FilePath IntunePackage.intunewin -FileUri $fileUri
```

## PARAMETERS

### -SasUri
The Azure Storage Blob Sas Uri

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

### -FilePath
The path to the file to upload

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

### -FileUri
The intune file Uri

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

### -AzureStorageUploadChunkSizeInMb
The size of the chunks to send to the Azure Storage Blob

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 6
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. No objects can be piped into this function
## OUTPUTS

### None. This function returns nothing
## NOTES
NAME: Add-FileToAzureStorage

## RELATED LINKS
