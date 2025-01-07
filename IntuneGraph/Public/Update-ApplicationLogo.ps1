function Update-ApplicationLogo {
    <#
    .SYNOPSIS
        This function is used to add a logo to an application in Microsoft Intune
    .DESCRIPTION
        This function is used to add a logo to an application in Microsoft Intune
    .EXAMPLE
        Update-ApplicationLogo -ApplicationId 'deedc70f-d790-4caf-962e-3871762d75a7' -LogoPath ./logo.png
    .EXAMPLE
        Update-ApplicationLogo -ApplicationId 'deedc70f-d790-4caf-962e-3871762d75a7' -LogoPath ./logo.jpg
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        None. This function returns nothing
    .NOTES
        NAME: Update-ApplicationLogo
    #>
    [CmdletBinding()]
    param (
        # The Application ID in Microsoft Intune
        [Parameter(Mandatory = $true)]
        [ValidatePattern('^[{]?[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}[}]?$')]
        [string] $ApplicationId,
        # The Path to the logo (JPEG or PNG)
        [Parameter(Mandatory = $true)]
        [ValidatePattern('^.*\.(jpe?g|png)$')]
        [string] $LogoPath
    )

    switch -regex ($LogoPath) {
        '.*\.jpe?g' {
            $mimeType = 'image/jpeg'
        }

        '.*\.png' {
            $mimeType = 'image/png'
        }
    }

    $application = Invoke-GetRequest -CollectionPath "mobileApps/$ApplicationId"
    
    $imageBytes = [System.IO.File]::ReadAllBytes($LogoPath)
    $imageContent = [System.Convert]::ToBase64String($imageBytes)

    $body = @{
        '@odata.type' = $application.'@odata.type'
        largeIcon = [ordered]@{
            '@odata.type' = 'microsoft.graph.mimeContent'
            type = $mimeType
            value = $imageContent
        }
    } | ConvertTo-Json -Depth 10

    Invoke-PatchRequest -CollectionPath "deviceAppManagement/mobileApps/$ApplicationId" -Body $body -ApiVersion 'beta'
}