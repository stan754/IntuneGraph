function Update-AzureStorageUpload {
  <#
  .SYNOPSIS
      This function renews the Azure storage upload to remain active
  .DESCRIPTION
      This function renews the Azure storage upload to remain active
  .EXAMPLE
      Update-AzureStorageUpload -FileUri $azureStorageUri
  .INPUTS
      None. No objects can be piped into this function
  .OUTPUTS
      None. This function returns nothing
  .NOTES
      NAME: Update-AzureStorageUpload
  #>
  param(
    # The file Uri to renew
    [Parameter(Mandatory = $true)]
    [string] $FileUri
  )
    
  $renewalUri = "$FileUri/renewUpload"
  $actionBody = ""
  $null = Invoke-PostRequest $renewalUri $actionBody

  $null = Wait-FileProcessing $FileUri "AzureStorageUriRenewal"
}