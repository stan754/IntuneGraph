function Remove-Application {
    <#
    .SYNOPSIS
        This function is used to remove an application from Microsoft Intune
    .DESCRIPTION
        This function is used to remove an application from Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module
    .EXAMPLE
        Remove-Application -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        None. This function outputs nothing
    .NOTES
        NAME: Remove-Application
    #>
    param (
        # The application ID in Intune
        [Parameter(Mandatory = $true)]
        [guid] $IntuneID
    )
    Invoke-DeleteRequest -CollectionPath "deviceAppManagement/mobileApps/$IntuneID" -ApiVersion 'beta'
}