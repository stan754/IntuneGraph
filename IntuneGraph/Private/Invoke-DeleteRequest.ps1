function Invoke-DeleteRequest {
    <#
    .SYNOPSIS
        This function invokes a delete request to the Microsoft Graph API
    .DESCRIPTION
        This function invokes a delete request to the Microsoft Graph API
    .EXAMPLE
        Invoke-DeleteRequest -CollectionPath $Uri
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function returns the response
    .NOTES
        NAME: Invoke-DeleteRequest
    #>
    param(
        # The path used for the request will be added behind the BaseUrl
        [Parameter(Mandatory = $true)]
        [string] $CollectionPath
    )

    Invoke-Request "DELETE" $CollectionPath
}