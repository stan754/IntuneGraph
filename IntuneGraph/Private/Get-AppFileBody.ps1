function Get-AppFileBody($name, $size, $sizeEncrypted, $manifest) {
  $body = @{ "@odata.type" = "#microsoft.graph.mobileAppContentFile" }
  $body.name = $name
  $body.sizeInBytes = $size
  $body.sizeEncryptedInBytes = $sizeEncrypted
  $body.manifest = $manifest
  $body.isDependency = $false

  $body
}