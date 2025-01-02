---
tags:
- Public
---
# Remove-ApplicationAssignment

## SYNOPSIS
This function is used to remove an application assignment from Microsoft Intune

## SYNTAX
```powershell
Remove-ApplicationAssignment [-IntuneID] <Guid> [[-AssignmentID] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function is used to remove an application assignment from Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module

## EXAMPLES

### EXAMPLE 1
```powershell
Remove-ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14 -AssignmentID 930cd379-4c25-4f63-bad1-687666abbb14_0_0
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
The assignment ID to delete

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
### None. This function outputs nothing

## NOTES
NAME: Remove-ApplicationAssignment

## RELATED LINKS

