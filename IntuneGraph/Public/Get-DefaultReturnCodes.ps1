function Get-DefaultReturnCodes {
    <#
    .SYNOPSIS
        This function is used to get the default returncodes for a Win32 Application in Microsoft Intune
    .DESCRIPTION
        This function is used to get the default returncodes for a Win32 Application in Microsoft Intune
    .EXAMPLE
        Get-DefaultReturnCodes
        # Returns the default returncodes from Microsoft Intune
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function outputs the default return codes used by Microsoft Intune
    .NOTES
        NAME: Get-DefaultReturnCodes
    #>
    @{"returnCode" = 0; "type" = "success" }, `
    @{"returnCode" = 1707; "type" = "success" }, `
    @{"returnCode" = 3010; "type" = "softReboot" }, `
    @{"returnCode" = 1641; "type" = "hardReboot" }, `
    @{"returnCode" = 1618; "type" = "retry" }
}
