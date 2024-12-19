function Add-MSStoreApp {
    <#
    .SYNOPSIS
        This function is used to make a MSStore Application in Microsoft Intune
    .DESCRIPTION
        This function is used to make a MSStore Application in Microsoft Intune
    .EXAMPLE
        Add-MSStoreApp -PackageIdentifier '9NCBCSZSJRSB'
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function outputs the application body received from the Graph API as an object
    .NOTES
        NAME: Add-MSStoreApp
    #>
    [CmdletBinding()]
    param(
        # The package Identifier from the Microsoft Store
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $PackageIdentifier,
        # The DisplayName for the application in Microsoft Intune
        # Optional, if left empty will be filled with default information from the store
        [parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string] $DisplayName,
        # The Publisher for the application in Microsoft Intune
        # Optional, if left empty will be filled with default information from the store
        [parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string] $Publisher,
        # The Description for the application in Microsoft Intune
        # Optional, if left empty will be filled with default information from the store
        [parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string] $Description,
        # The architecture for the package from the Microsoft Store
        [parameter(Mandatory = $false)]
        [ValidateSet('x64', 'x86', 'arm64')]
        [string] $Architecture = 'x64',
        # The Install scope of the application in Microsoft Intune
        # Optional, if left empty will be filled with default information from the store
        [parameter(Mandatory = $false)]
        [ValidateSet('system', 'user')]
        [string] $InstallScope,
        # The information url for the application in Microsoft Intune
        # Optional, if left empty will be filled with default information from the store
        [parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string] $InformationUrl,
        # The privacy url for the application in Microsoft Intune
        # Optional, if left empty will be filled with default information from the store
        [parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string] $PrivacyUrl,
        # Should the application be shown as featured in the Company Portal
        [parameter(Mandatory = $false)]
        [bool] $Featured = $false
    )

    $manifest = Invoke-MSStoreManifestRequest -PackageIdentifier $PackageIdentifier

    if ($manifest) {
        $installer = $manifest.Data.Versions[-1].Installers | Where-Object { $_.Architecture -eq $Architecture}
        $defaultLocale = $manifest.Data.Versions[-1].DefaultLocale
    }

    if (-not $DisplayName) {
        $DisplayName = $defaultLocale.PackageName
    }

    if (-not $Publisher) {
        $Publisher = $defaultLocale.Publisher
    }

    if (-not $Description) {
        $Description = $defaultLocale.ShortDescription
    }

    if (-not $InstallScope) {
        $InstallScope = $installer.Scope
    }

    if (-not $InformationUrl) {
        $InformationUrl = $defaultLocale.PublisherUrl
    }

    if (-not $PrivacyUrl) {
        $PrivacyUrl = $defaultLocale.PrivacyUrl
    }

    $appBody = [ordered]@{
        '@odata.type'         = "#microsoft.graph.winGetApp"
        description           = $Description
        developer             = $Publisher
        displayName           = $DisplayName
        informationUrl        = $InformationUrl
        installExperience     = [ordered]@{
            runAsAccount = $InstallScope
        }
        isFeatured            = $Featured
        packageIdentifier     = $PackageIdentifier
        privacyInformationUrl = $PrivacyUrl
        publisher             = $Publisher
    } | ConvertTo-Json -Depth 10

    Invoke-PostRequest -CollectionPath 'mobileApps' -Body $appBody
}