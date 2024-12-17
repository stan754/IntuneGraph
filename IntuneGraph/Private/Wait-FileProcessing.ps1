function Wait-FileProcessing {
    param (
        [Parameter(Mandatory = $true)]
        [string] $fileUri, 
        [Parameter(Mandatory = $true)]
        [string] $stage
    )
    $attempts = 600
    $waitTimeInSeconds = 10

    $successState = "$($stage)Success"
    $pendingState = "$($stage)Pending"

    $file = $null
    while ($attempts -gt 0) {
        $file = Invoke-GetRequest $fileUri

        if ($file.uploadState -eq $successState) {
            break
        }
        elseif ($file.uploadState -ne $pendingState) {
            throw "File upload state is not success: $($file.uploadState). Exception: $($_.Exception.Message)"
        }

        Start-Sleep $waitTimeInSeconds
        $attempts--
    }

    if ($null -eq $file -or $file.uploadState -ne $successState) {
        throw "File request did not complete in the allotted time."
    }

    $file
}