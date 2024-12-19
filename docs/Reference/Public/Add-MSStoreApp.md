---
tags:
- Public
---
# Add-MSStoreApp

## SYNOPSIS
This function is used to make a MSStore Application in Microsoft Intune

## SYNTAX
```powershell
Add-MSStoreApp [-PackageIdentifier] <String> [[-DisplayName] <String>] [[-Publisher] <String>] [[-Description] <String>] [[-Architecture] <String>] [[-InstallScope] <String>] [[-InformationUrl] <String>] [[-PrivacyUrl] <String>] [[-Featured] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
This function is used to make a MSStore Application in Microsoft Intune

## EXAMPLES

### EXAMPLE 1
```powershell
Add-MSStoreApp -PackageIdentifier '9NCBCSZSJRSB'
```

## PARAMETERS

### -PackageIdentifier
The package Identifier from the Microsoft Store

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

### -DisplayName
The DisplayName for the application in Microsoft Intune
Optional, if left empty will be filled with default information from the store

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Publisher
The Publisher for the application in Microsoft Intune
Optional, if left empty will be filled with default information from the store

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

### -Description
The Description for the application in Microsoft Intune
Optional, if left empty will be filled with default information from the store

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Architecture
The architecture for the package from the Microsoft Store

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
Default value: x64
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallScope
The Install scope of the application in Microsoft Intune
Optional, if left empty will be filled with default information from the store

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InformationUrl
The information url for the application in Microsoft Intune
Optional, if left empty will be filled with default information from the store

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrivacyUrl
The privacy url for the application in Microsoft Intune
Optional, if left empty will be filled with default information from the store

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Featured
Should the application be shown as featured in the Company Portal

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases: 

Required: False
Position: 9
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### This function outputs the application body received from the Graph API as an object

## NOTES
NAME: Add-MSStoreApp

## RELATED LINKS

