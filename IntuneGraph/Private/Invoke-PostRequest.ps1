function Invoke-PostRequest {
  param(
    [Parameter(Mandatory = $true)]
    [string] $collectionPath, 
    [Parameter(Mandatory = $true)]
    [string] $body
  )
  
  Invoke-Request "POST" $collectionPath $body
}