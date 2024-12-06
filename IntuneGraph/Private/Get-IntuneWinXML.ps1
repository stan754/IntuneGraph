Function Get-IntuneWinXML() {
  param(
    [Parameter(Mandatory = $true)]
    $SourceFile,
    [Parameter(Mandatory = $true)]
    $fileName,
    [Parameter(Mandatory = $false)]
    [ValidateSet("false", "true")]
    [string]$removeitem = "true"
  )

  Test-SourceFile "$SourceFile"

  $Directory = [System.IO.Path]::GetDirectoryName("$SourceFile")

  Add-Type -Assembly System.IO.Compression.FileSystem
  $zip = [IO.Compression.ZipFile]::OpenRead("$SourceFile")

  $zip.Entries | Where-Object { $_.Name -like "$filename" } | ForEach-Object {
    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_, "$Directory\$filename", $true)
  }

  $zip.Dispose()

  [xml]$IntuneWinXML = Get-Content "$Directory\$filename"

  return $IntuneWinXML

  if ($removeitem -eq "true") { remove-item "$Directory\$filename" }
}