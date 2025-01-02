---
tags:
- Public
---
# Get-ApplicationAssignment

## SYNOPSIS
This function is used to get Application assignment information from Microsoft Intune

## SYNTAX
```powershell
Get-ApplicationAssignment [-IntuneID] <Guid> [[-AssignmentID] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function is used to get Application assignment information from Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module

## EXAMPLES

### EXAMPLE 1
```powershell
Get-ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14
```

### EXAMPLE 2
```powershell
Get-ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14 -AssignmentID f4802a47-fb2e-49ce-91ba-ec8b3ae0d28a_1_0
```

## PARAMETERS

### -IntuneID
The application ID in Intune

```yaml
Type: Guid
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssignmentID
The assignment ID to get a specific one

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

### CommonParameters
This cmdlet supports the common parameters: -Verbose, -Debug, -ErrorAction, -WarningAction, -InformationAction, -ProgressAction, -ErrorVariable, -WarningVariable, -InformationVariable, -OutVariable, -OutBuffer, and -PipelineVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS
### None. No objects can be piped into this function

## OUTPUTS
### This function outputs the application assignment body received from the Graph API as an object

## NOTES
NAME: Get-ApplicationAssignment

## RELATED LINKS

