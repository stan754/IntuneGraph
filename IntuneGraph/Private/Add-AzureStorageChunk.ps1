function Add-AzureStorageChunk {
    <#
    .SYNOPSIS
        This function uploads a chunk to an Azure Storage Blob using a Sas Uri
    .DESCRIPTION
        This function uploads a chunk to an Azure Storage Blob using a Sas Uri
    .EXAMPLE
        Add-AzureStorageChunk -SasUri $SasUri -Id $id -Body $bytes
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        None. This function returns nothing
    .NOTES
        NAME: Add-AzureStorageChunk
    #>
    param(
        # The Azure Storage Blob Sas Uri
        [Parameter(Mandatory = $true)]
        [string] $SasUri, 
        # The Id of the block that has to be uploaded
        [Parameter(Mandatory = $true)]
        [string] $Id, 
        # The block to upload in a byte array
        [Parameter(Mandatory = $true)]
        [byte[]] $Body
    )

    $uri = "$SasUri&comp=block&blockid=$Id"
    $request = "PUT $uri"

    $iso = [System.Text.Encoding]::GetEncoding("iso-8859-1")
    $encodedBody = $iso.GetString($Body)
    $headers = @{
        "content-type"   = "text/plain; charset=iso-8859-1"
        "x-ms-blob-type" = "BlockBlob"
    }

    try {
        $null = Invoke-WebRequest $uri -Method Put -Headers $headers -Body $encodedBody
    }
    catch {
        throw "'$request' Failed with exception: $($_.Exception.Message)"
    }
}