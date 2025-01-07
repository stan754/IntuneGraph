function Invoke-Request {
    <#
    .SYNOPSIS
        This function invokes a request to the Microsoft Graph API
    .DESCRIPTION
        This function invokes a request to the Microsoft Graph API
    .EXAMPLE
        Invoke-Request -Method "POST" -CollectionPath $Uri -Body $Body
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function returns the response
    .NOTES
        NAME: Invoke-Request
    #>
    param (
        # The method to use for the request
        [Parameter(Mandatory = $true)]
        [ValidateSet("GET", "POST", "PATCH", "DELETE")]
        [string] $Method,
        # The path used for the request will be added behind the BaseUrl
        [Parameter(Mandatory = $true)]
        [string] $CollectionPath,
        # The body to be added to the request
        [Parameter(Mandatory = $false)]
        [string] $Body,
        # The Graph API version
        [Parameter(Mandatory = $false)]
        [ValidateSet('v1.0', 'beta')]
        [string] $ApiVersion = 'beta'
    )

    $BaseUrl = "https://graph.microsoft.com/$ApiVersion/"
    $uri = "$BaseUrl$CollectionPath"
    $request = "$Method $uri"

    if ($PSBoundParameters.ContainsKey('Body')) {
        $params = @{
            Uri         = $uri
            Method      = $Method
            Body        = $Body
            ContentType = 'application/json'
        }
    }
    else {
        $params = @{
            Uri    = $uri
            Method = $Method
        }
    }

    try {
        $response = Invoke-MgGraphRequest @params
        $response
    }
    catch {
        throw "'$request' Failed with exception: $($_.Exception.Message)"
    }
}