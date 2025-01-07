function Invoke-AzureStorageUploadRenew {
    <#
    .SYNOPSIS
        This function renews the Azure storage upload to remain active
    .DESCRIPTION
        This function renews the Azure storage upload to remain active
    .EXAMPLE
        Invoke-AzureStorageUploadRenew -FileUri $azureStorageUri
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        None. This function returns nothing
    .NOTES
        NAME: Invoke-AzureStorageUploadRenew
    #>
    param(
        # The file Uri to renew
        [Parameter(Mandatory = $true)]
        [string] $FileUri
    )

    $renewalUri = "$FileUri/renewUpload"
    $actionBody = ""
    $null = Invoke-PostRequest -CollectionPath $renewalUri -Body $actionBody -ApiVersion 'beta'

    $null = Wait-FileProcessing $FileUri "AzureStorageUriRenewal"
}