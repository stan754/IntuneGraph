# Invoke-Request

## SYNOPSIS
This function invokes a request to the Microsoft Graph API

## SYNTAX
```powershell
Invoke-Request [-Method] <String> [-CollectionPath] <String> [[-Body] <String>] [[-BaseUrl] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function invokes a request to the Microsoft Graph API

## EXAMPLES

### EXAMPLE 1
```powershell
Invoke-Request -Method "POST" -CollectionPath $Uri -Body $Body
```

## PARAMETERS

### -Method
The method to use for the request

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

### -CollectionPath
The path used for the request will be added behind the BaseUrl

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
The body to be added to the request

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BaseUrl
The base url used for all requests

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: https://graph.microsoft.com/beta/deviceAppManagement/
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
NAME: Invoke-Request

## RELATED LINKS

