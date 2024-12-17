function Invoke-GetRequest {
  param(
    [Parameter(Mandatory = $true)]
    [string] $collectionPath
  )

  Invoke-Request "GET" $collectionPath
}