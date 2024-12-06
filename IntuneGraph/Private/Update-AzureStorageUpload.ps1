function Update-AzureStorageUpload($fileUri) {
  $renewalUri = "$fileUri/renewUpload"
  $actionBody = ""
  $null = Invoke-PostRequest $renewalUri $actionBody

  $null = Wait-FileProcessing $fileUri "AzureStorageUriRenewal"
}