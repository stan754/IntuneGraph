Function Get-IntuneWinXML() {
  param(
    [Parameter(Mandatory = $true)]
    $SourceFile,
    [Parameter(Mandatory = $true)]
    $fileName
  )

  Test-SourceFile "$SourceFile"

  try {
    Add-Type -Assembly System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($SourceFile)
    $file = $archive.Entries | Where-Object { $_.Name -eq $fileName }
    $stream = $file.Open()
    $reader = New-Object System.IO.BinaryReader($stream)
    $output = $reader.ReadBytes($stream.Length)
    $reader.Close()
    $stream.Close()
    [xml]$IntuneWinXML = [System.Text.Encoding]::UTF8.GetString($output)
    return $IntuneWinXML
  }
  catch {
    Write-Error "Failed to read file '$SourceFile'. Error: $_"
  }
  finally {
    if ($archive) {
      $archive.Dispose()
    }
  }
}