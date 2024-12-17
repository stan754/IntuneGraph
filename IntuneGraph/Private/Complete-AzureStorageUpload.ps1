function Complete-AzureStorageUpload {
    <#
    .SYNOPSIS
        This function completes the Azure storage upload by committing the block list
    .DESCRIPTION
        This function completes the Azure storage upload by committing the block list
    .EXAMPLE
        Complete-AzureStorageUpload -SasUri $file.azureStorageUri -Ids $ids
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function returns the response of the completion request
    .NOTES
        NAME: Complete-AzureStorageUpload
    #>
    param(
        # The Sas Uri to commit the block list to
        [Parameter(Mandatory = $true)]
        [string] $SasUri, 
        # An array of Ids for the block list
        [Parameter(Mandatory = $true)]
        [array] $Ids
    )

    $uri = "$SasUri&comp=blocklist"
    $request = "PUT $uri"

    $xml = '<?xml version="1.0" encoding="utf-8"?><BlockList>'
    foreach ($id in $Ids) {
        $xml += "<Latest>$id</Latest>"
    }
    $xml += '</BlockList>'

    try {
        Invoke-RestMethod $uri -Method Put -Body $xml
    }
    catch {
        throw "'$request' Failed with exception: $($_.Exception.Message)"
    }
}