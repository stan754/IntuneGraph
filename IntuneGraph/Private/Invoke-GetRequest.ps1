function Invoke-GetRequest {
    <#
    .SYNOPSIS
        This function invokes a get request to the Microsoft Graph API
    .DESCRIPTION
        This function invokes a get request to the Microsoft Graph API
    .EXAMPLE
        Invoke-GetRequest -CollectionPath $Uri
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function returns the response
    .NOTES
        NAME: Invoke-GetRequest
    #>
    param(
        # The path used for the request will be added behind the BaseUrl
        [Parameter(Mandatory = $true)]
        [string] $CollectionPath
    )

    Invoke-Request "GET" $CollectionPath
}