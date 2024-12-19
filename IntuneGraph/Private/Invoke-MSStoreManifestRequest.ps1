function Invoke-MSStoreManifestRequest {
    <#
    .SYNOPSIS
        This function is used to retrieve the package information manifest from the Microsoft Store
    .DESCRIPTION
        This function is used to retrieve the package information manifest from the Microsoft Store
    .EXAMPLE
        Invoke-MSStoreManifestRequest -PackageIdentifier '9NCBCSZSJRSB'
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function outputs the manifest body received as an object
    .NOTES
        NAME: Invoke-MSStoreManifestRequest
    #>
    [CmdletBinding()]
    param(
        # The package Identifier from the Microsoft Store
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $PackageIdentifier
    )

    $packageManifestUrl = "https://storeedgefd.dsx.mp.microsoft.com/v9.0/packageManifests"
    Invoke-RestMethod -Method Get -Uri "$packageManifestUrl/$PackageIdentifier"
}