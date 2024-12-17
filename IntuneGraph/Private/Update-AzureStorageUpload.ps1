function Update-AzureStorageUpload {
  param(
    [Parameter(Mandatory = $true)]
    [string] $fileUri
  )
    
  $renewalUri = "$fileUri/renewUpload"
  $actionBody = ""
  $null = Invoke-PostRequest $renewalUri $actionBody

  $null = Wait-FileProcessing $fileUri "AzureStorageUriRenewal"
}