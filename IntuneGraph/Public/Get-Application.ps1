function Get-Application {
    <#
    .SYNOPSIS
        This function is used to get Application information from Microsoft Intune
    .DESCRIPTION
        This function is used to get Application information from Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module
    .EXAMPLE
        Get-Application -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function outputs the application body received from the Graph API as an object
    .NOTES
        NAME: Get-Application
    #>
    param (
        # The application ID in Intune
        [Parameter(Mandatory = $true)]
        [guid] $IntuneID
    )
    
    Invoke-GetRequest -CollectionPath "deviceAppManagement/mobileApps/$IntuneID" -ApiVersion 'beta'
}