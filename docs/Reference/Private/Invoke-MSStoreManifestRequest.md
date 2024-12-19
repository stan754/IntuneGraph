---
tags:
- Private
---
# Invoke-MSStoreManifestRequest

## SYNOPSIS
This function is used to retrieve the package information manifest from the Microsoft Store

## SYNTAX
```powershell
Invoke-MSStoreManifestRequest [-PackageIdentifier] <String> [<CommonParameters>]
```

## DESCRIPTION
This function is used to retrieve the package information manifest from the Microsoft Store

## EXAMPLES

### EXAMPLE 1
```powershell
Invoke-MSStoreManifestRequest -PackageIdentifier '9NCBCSZSJRSB'
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

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### This function outputs the manifest body received as an object

## NOTES
NAME: Invoke-MSStoreManifestRequest

## RELATED LINKS

