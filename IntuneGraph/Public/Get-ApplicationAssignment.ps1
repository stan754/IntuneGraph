function Get-ApplicationAssignment {
    <#
    .SYNOPSIS
        This function is used to get Application assignment information from Microsoft Intune
    .DESCRIPTION
        This function is used to get Application assignment information from Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module
    .EXAMPLE
        Get-ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14
    .EXAMPLE
        Get-ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14 -AssignmentID f4802a47-fb2e-49ce-91ba-ec8b3ae0d28a_1_0
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function outputs the application assignment body received from the Graph API as an object
    .NOTES
        NAME: Get-ApplicationAssignment
    #>
    param (
        # The application ID in Intune
        [Parameter(Mandatory = $true)]
        [guid] $IntuneID,
        # The assignment ID to get a specific one
        [Parameter(Mandatory = $false)]
        [string] $AssignmentID
    )
    if ($AssignmentID) {
        Invoke-GetRequest "mobileApps/$IntuneID/assignments/$AssignmentID"
    } else {
        Invoke-GetRequest "mobileApps/$IntuneID/assignments"
    }
}