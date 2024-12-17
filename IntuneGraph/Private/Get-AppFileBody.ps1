function Get-AppFileBody {
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $Name, 
    [Parameter(Mandatory = $true)]
    [Int64] $Size, 
    [Parameter(Mandatory = $true)]
    [Int64] $SizeEncrypted, 
    [Parameter(Mandatory = $false)]
    $Manifest = $null
  )

  $body = @{ "@odata.type" = "#microsoft.graph.mobileAppContentFile" }
  $body.name = $Name
  $body.sizeInBytes = $Size
  $body.sizeEncryptedInBytes = $SizeEncrypted
  $body.manifest = $Manifest
  $body.isDependency = $false

  $body
}