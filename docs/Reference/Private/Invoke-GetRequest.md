---
tags:
- Private
---
# Invoke-GetRequest

## SYNOPSIS
This function invokes a get request to the Microsoft Graph API

## SYNTAX
```powershell
Invoke-GetRequest [-CollectionPath] <String> [[-ApiVersion] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function invokes a get request to the Microsoft Graph API

## EXAMPLES

### EXAMPLE 1
```powershell
Invoke-GetRequest -CollectionPath $Uri
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

### -ApiVersion
The Graph API version

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Valid Values: ['v1.0', 'beta']

Required: False
Position: 2
Default value: beta
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### This function returns the response

## NOTES
NAME: Invoke-GetRequest

## RELATED LINKS

