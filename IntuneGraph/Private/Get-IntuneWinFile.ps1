Function Get-IntuneWinFile() {
    param(
        [Parameter(Mandatory = $true)]
        [string] $SourceFile,
        [Parameter(Mandatory = $true)]
        [string] $fileName
    )

    $Directory = New-TemporaryFolder

    Add-Type -Assembly System.IO.Compression.FileSystem
    $zip = [IO.Compression.ZipFile]::OpenRead("$SourceFile")

    $zip.Entries | Where-Object { $_.Name -like "$filename" } | ForEach-Object {
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_, "$Directory\$filename", $true)
    }

    $zip.Dispose()

    return "$Directory\$filename"
}