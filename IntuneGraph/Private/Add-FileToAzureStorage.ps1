function Add-FileToAzureStorage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $SasUri,
        [Parameter(Mandatory = $true)]
        [string] $FilePath,
        [Parameter(Mandatory = $true)]
        [string] $FileUri,
        [Parameter(Mandatory = $false)]
        [int] $AzureStorageUploadChunkSizeInMb = 6l
    )
    try {
        $chunkSizeInBytes = 1024l * 1024l * $AzureStorageUploadChunkSizeInMb
  
        # Start the timer for SAS URI renewal.
        $sasRenewalTimer = [System.Diagnostics.Stopwatch]::StartNew()
  
        # Find the file size and open the file.
        $fileSize = (Get-Item $FilePath).length
        $chunks = [Math]::Ceiling($fileSize / $chunkSizeInBytes)
        $reader = New-Object System.IO.BinaryReader([System.IO.File]::Open($FilePath, [System.IO.FileMode]::Open))
        $null = $reader.BaseStream.Seek(0, [System.IO.SeekOrigin]::Begin)
  
        # Upload each chunk. Check whether a SAS URI renewal is required after each chunk is uploaded and renew if needed.
        $ids = @()

        for ($chunk = 0; $chunk -lt $chunks; $chunk++) {
            $currentChunk = $chunk + 1			

            $id = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($currentChunk.ToString("block-00000000")))
            $ids += $id

            $start = $chunk * $chunkSizeInBytes
            $length = [Math]::Min($chunkSizeInBytes, $fileSize - $start)
            $bytes = $reader.ReadBytes($length)
    
            Write-Progress -Activity "Uploading File to Azure Storage" -status "Uploading chunk $currentChunk of $chunks" `
                -percentComplete ($currentChunk / $chunks * 100)

            $null = Add-AzureStorageChunk $SasUri $id $bytes
    
            # Renew the SAS URI if 7 minutes have elapsed since the upload started or was renewed last.
            if ($currentChunk -lt $chunks -and $sasRenewalTimer.ElapsedMilliseconds -ge 450000) {
                $null = Update-AzureStorageUpload $FileUri
                $sasRenewalTimer.Restart()
            }
        }
        Write-Progress -Completed -Activity "Uploading File to Azure Storage"

        $reader.Close()
    }

    finally {
        if ($null -ne $reader) { $reader.Dispose() }
    }

    # Finalize the upload.
    $null = Complete-AzureStorageUpload $SasUri $ids
}