function Remove-ApplicationAssignment {
    <#
    .SYNOPSIS
        This function is used to remove an application assignment from Microsoft Intune
    .DESCRIPTION
        This function is used to remove an application assignment from Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module
    .EXAMPLE
        Remove-ApplicationAssignment -IntuneID 930cd379-4c25-4f63-bad1-687666abbb14 -AssignmentID 930cd379-4c25-4f63-bad1-687666abbb14_0_0
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        None. This function outputs nothing
    .NOTES
        NAME: Remove-ApplicationAssignment
    #>
    param (
        # The application ID in Intune
        [Parameter(Mandatory = $true)]
        [guid] $IntuneID,
        # The assignment ID to delete
        [Parameter(Mandatory = $false)]
        [string] $AssignmentID
    )
    Invoke-DeleteRequest -CollectionPath "deviceAppManagement/mobileApps/$IntuneID/assignments/$AssignmentID" -ApiVersion 'beta'
}