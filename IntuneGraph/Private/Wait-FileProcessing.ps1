function Wait-FileProcessing {
    <#
    .SYNOPSIS
        This function waits for a file to finish processing a specified stage
    .DESCRIPTION
        This function waits for a file to finish processing a specified stage
    .EXAMPLE
        Wait-FileProcessing -FileUri "mobileApps/$appId/$LOBType/contentVersions/$contentVersionId/files/$fileId" -Stage "AzureStorageUriRequest"
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function outputs the mobileAppContentFile body when the state is success
    .NOTES
        NAME: Wait-FileProcessing
    #>
    param (
        # The Microsoft Graph API Uri of the file
        [Parameter(Mandatory = $true)]
        [string] $FileUri, 
        # The stage to wait for to successfully complete
        [Parameter(Mandatory = $true)]
        [string] $Stage
    )
    $attempts = 600
    $waitTimeInSeconds = 10

    $successState = "$($Stage)Success"
    $pendingState = "$($Stage)Pending"

    $file = $null
    while ($attempts -gt 0) {
        $file = Invoke-GetRequest $FileUri

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