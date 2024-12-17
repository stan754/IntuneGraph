function Invoke-PostRequest {
  <#
  .SYNOPSIS
      This function invokes a post request to the Microsoft Graph API
  .DESCRIPTION
      This function invokes a post request to the Microsoft Graph API
  .EXAMPLE
      Invoke-PostRequest -CollectionPath $Uri -Body $Body
  .INPUTS
      None. No objects can be piped into this function
  .OUTPUTS
      This function returns the response
  .NOTES
      NAME: Invoke-PostRequest
  #>
  param(
    # The path used for the request will be added behind the BaseUrl
    [Parameter(Mandatory = $true)]
    [string] $CollectionPath, 
    # The body used for the request
    [Parameter(Mandatory = $true)]
    [string] $Body
  )
  
  Invoke-Request "POST" $CollectionPath $Body
}