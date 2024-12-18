# Complete-AzureStorageUpload

## SYNOPSIS
This function completes the Azure storage upload by committing the block list

## SYNTAX
```powershell
Complete-AzureStorageUpload [-SasUri] <String> [-Ids] <Array> [<CommonParameters>]
```

## DESCRIPTION
This function completes the Azure storage upload by committing the block list

## EXAMPLES

### EXAMPLE 1
```powershell
Complete-AzureStorageUpload -SasUri $file.azureStorageUri -Ids $ids
```

## PARAMETERS

### -SasUri
The Sas Uri to commit the block list to

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

### -Ids
An array of Ids for the block list

```yaml
Type: Array
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
### This function returns the response of the completion request

## NOTES
NAME: Complete-AzureStorageUpload

## RELATED LINKS

