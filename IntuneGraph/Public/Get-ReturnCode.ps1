function Get-ReturnCode {
    <#
    .SYNOPSIS
        This function is used to create new returncodes for a Win32 Application in Microsoft Intune
    .DESCRIPTION
        This function is used to create new returncodes for a Win32 Application in Microsoft Intune
    .EXAMPLE
        Get-ReturnCode -ReturnCode 1707 -Type 'success'
        # Returns the default returncodes from Microsoft Intune
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function outputs a new return code for a Win32 Application in Microsoft Intune
    .NOTES
        NAME: Get-ReturnCode
    #>
    param (
      # The return code
      [parameter(Mandatory = $true)]
      [int] $ReturnCode,
      # The type of return code (success, softreboot, hardreboot, retry)
      [parameter(Mandatory = $true)]
      [ValidateSet('success', 'softReboot', 'hardReboot', 'retry')]
      [string] $Type
    )

    @{"returnCode" = $ReturnCode; "type" = "$Type" }
}