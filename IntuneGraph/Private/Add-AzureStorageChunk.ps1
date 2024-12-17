function Add-AzureStorageChunk {
    param(
        [Parameter(Mandatory = $true)]
        [string] $sasUri, 
        [Parameter(Mandatory = $true)]
        [string] $id, 
        [Parameter(Mandatory = $true)]
        [byte[]] $body
    )

    $uri = "$sasUri&comp=block&blockid=$id"
    $request = "PUT $uri"

    $iso = [System.Text.Encoding]::GetEncoding("iso-8859-1")
    $encodedBody = $iso.GetString($body)
    $headers = @{
        "content-type"   = "text/plain; charset=iso-8859-1"
        "x-ms-blob-type" = "BlockBlob"
    }

    try {
        $null = Invoke-WebRequest $uri -Method Put -Headers $headers -Body $encodedBody
    }
    catch {
        Write-Host -ForegroundColor Red $request
        Write-Host -ForegroundColor Red $_.Exception.Message
        throw
    }
}