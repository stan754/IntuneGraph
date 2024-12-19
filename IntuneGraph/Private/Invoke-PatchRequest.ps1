function Invoke-PatchRequest {
    <#
    .SYNOPSIS
        This function invokes a patch request to the Microsoft Graph API
    .DESCRIPTION
        This function invokes a patch request to the Microsoft Graph API
    .EXAMPLE
        Invoke-PatchRequest -CollectionPath $Uri -Body $Body
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function returns the response
    .NOTES
        NAME: Invoke-PatchRequest
    #>
    param(
        # The path used for the request will be added behind the BaseUrl
        [Parameter(Mandatory = $true)]
        [string] $CollectionPath,
        # The body used for the request
        [Parameter(Mandatory = $true)]
        [string] $Body
    )

    Invoke-Request "PATCH" $CollectionPath $Body
}