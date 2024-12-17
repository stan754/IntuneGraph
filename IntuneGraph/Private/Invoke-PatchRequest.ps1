function Invoke-PatchRequest {
  param(
    [Parameter(Mandatory = $true)]
    [string] $collectionPath, 
    [Parameter(Mandatory = $true)]
    [string] $body
  )

  Invoke-Request "PATCH" $collectionPath $body
}