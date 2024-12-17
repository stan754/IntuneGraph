# Invoke-PatchRequest

## SYNOPSIS
This function invokes a patch request to the Microsoft Graph API

## SYNTAX

```
Invoke-PatchRequest [-CollectionPath] <String> [-Body] <String> [<CommonParameters>]
```

## DESCRIPTION
This function invokes a patch request to the Microsoft Graph API

## EXAMPLES

### EXAMPLE 1
```
Invoke-PatchRequest -CollectionPath $Uri -Body $Body
```

## PARAMETERS

### -CollectionPath
The path used for the request will be added behind the BaseUrl

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

### -Body
The body used for the request

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

### This function returns the response
## NOTES
NAME: Invoke-PatchRequest

## RELATED LINKS
