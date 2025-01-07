---
tags:
- Public
---
# Get-ReturnCode

## SYNOPSIS
This function is used to create new returncodes for a Win32 Application in Microsoft Intune

## SYNTAX
```powershell
Get-ReturnCode [-ReturnCode] <Int32> [-Type] <String> [<CommonParameters>]
```

## DESCRIPTION
This function is used to create new returncodes for a Win32 Application in Microsoft Intune

## EXAMPLES

### EXAMPLE 1
```powershell
Get-ReturnCode -ReturnCode 1707 -Type 'success'
# Returns the default returncodes from Microsoft Intune
```

## PARAMETERS

### -ReturnCode
The return code

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
The type of return code (success, softreboot, hardreboot, retry)

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Valid Values: ['success', 'softReboot', 'hardReboot', 'retry']

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
### This function outputs a new return code for a Win32 Application in Microsoft Intune

## NOTES
NAME: Get-ReturnCode

## RELATED LINKS

