function Get-AppFileBody {
    <#
    .SYNOPSIS
        This function returns the detection.xml from inside the outer intunewin archive
    .DESCRIPTION
        This function returns the detection.xml from inside the outer intunewin archive
    .EXAMPLE
        Get-AppFileBody -Name IntunePackage.intunewin -Size 522 -SizeEncrypted (Get-Item "package.intunewin").Length
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function returns a mobileAppContentFile body
    .NOTES
        NAME: Get-AppFileBody
    #>
    param(
        # The file name
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Name,
        # The size of the file prior to encryption
        [Parameter(Mandatory = $true)]
        [Int64] $Size,
        # The size of the file after encryption
        [Parameter(Mandatory = $true)]
        [Int64] $SizeEncrypted,
        # The manifest information
        [Parameter(Mandatory = $false)]
        $Manifest = $null
    )

    $body = @{ "@odata.type" = "#microsoft.graph.mobileAppContentFile" }
    $body.name = $Name
    $body.sizeInBytes = $Size
    $body.sizeEncryptedInBytes = $SizeEncrypted
    $body.manifest = $Manifest
    $body.isDependency = $false

    $body
}