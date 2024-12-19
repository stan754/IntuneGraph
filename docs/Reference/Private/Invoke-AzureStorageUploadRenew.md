---
tags:
- Private
---
# Invoke-AzureStorageUploadRenew

## SYNOPSIS
This function renews the Azure storage upload to remain active

## SYNTAX
```powershell
Invoke-AzureStorageUploadRenew [-FileUri] <String> [<CommonParameters>]
```

## DESCRIPTION
This function renews the Azure storage upload to remain active

## EXAMPLES

### EXAMPLE 1
```powershell
Invoke-AzureStorageUploadRenew -FileUri $azureStorageUri
```

## PARAMETERS

### -FileUri
The file Uri to renew

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

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### None. This function returns nothing

## NOTES
NAME: Invoke-AzureStorageUploadRenew

## RELATED LINKS

