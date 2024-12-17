# Add-AzureStorageChunk

## SYNOPSIS
This function uploads a chunk to an Azure Storage Blob using a Sas Uri

## SYNTAX

```
Add-AzureStorageChunk [-SasUri] <String> [-Id] <String> [-Body] <Byte[]> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
This function uploads a chunk to an Azure Storage Blob using a Sas Uri

## EXAMPLES

### EXAMPLE 1
```
Add-AzureStorageChunk -SasUri $SasUri -Id $id -Body $bytes
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

### -Id
The Id of the block that has to be uploaded

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

### -Body
The block to upload in a byte array

```yaml
Type: Byte[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

### None. This function returns nothing
## NOTES
NAME: Add-AzureStorageChunk

## RELATED LINKS
