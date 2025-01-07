---
tags:
- Public
---
# Update-ApplicationLogo

## SYNOPSIS
This function is used to add a logo to an application in Microsoft Intune

## SYNTAX
```powershell
Update-ApplicationLogo [-ApplicationId] <String> [-LogoPath] <String> [<CommonParameters>]
```

## DESCRIPTION
This function is used to add a logo to an application in Microsoft Intune

## EXAMPLES

### EXAMPLE 1
```powershell
Update-ApplicationLogo -ApplicationId 'deedc70f-d790-4caf-962e-3871762d75a7' -LogoPath ./logo.png
```

### EXAMPLE 2
```powershell
Update-ApplicationLogo -ApplicationId 'deedc70f-d790-4caf-962e-3871762d75a7' -LogoPath ./logo.jpg
```

## PARAMETERS

### -ApplicationId
The Application ID in Microsoft Intune

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

### -LogoPath
The Path to the logo (JPEG or PNG)

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
### None. This function returns nothing

## NOTES
NAME: Update-ApplicationLogo

## RELATED LINKS

