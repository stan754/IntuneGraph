Function Get-IntuneWinFile() {
    param(
        [Parameter(Mandatory = $true)]
        $SourceFile,
        [Parameter(Mandatory = $true)]
        $fileName,
        [Parameter(Mandatory = $false)]
        [string]$Folder = "win32"
    )

    $Directory = [System.IO.Path]::GetDirectoryName("$SourceFile")

    if (!(Test-Path "$Directory\$folder")) {
        New-Item -ItemType Directory -Path "$Directory" -Name "$folder" | Out-Null
    }

    Add-Type -Assembly System.IO.Compression.FileSystem
    $zip = [IO.Compression.ZipFile]::OpenRead("$SourceFile")

    $zip.Entries | Where-Object { $_.Name -like "$filename" } | ForEach-Object {
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_, "$Directory\$folder\$filename", $true)
    }

    $zip.Dispose()

    return "$Directory\$folder\$filename"

    if ($removeitem -eq "true") { remove-item "$Directory\$filename" }
}