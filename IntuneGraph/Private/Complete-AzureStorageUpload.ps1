function Complete-AzureStorageUpload {
    param(
        [Parameter(Mandatory = $true)]
        [string] $sasUri, 
        [Parameter(Mandatory = $true)]
        [array] $ids
    )

    $uri = "$sasUri&comp=blocklist"
    $request = "PUT $uri"

    $xml = '<?xml version="1.0" encoding="utf-8"?><BlockList>'
    foreach ($id in $ids) {
        $xml += "<Latest>$id</Latest>"
    }
    $xml += '</BlockList>'

    try {
        Invoke-RestMethod $uri -Method Put -Body $xml
    }
    catch {
        Write-Host -ForegroundColor Red $request
        Write-Host -ForegroundColor Red $_.Exception.Message
        throw
    }
}