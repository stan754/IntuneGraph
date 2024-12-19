function Get-IntuneWinFile {
    <#
    .SYNOPSIS
        This function returns the encrypted intunewin file from inside the outer intunewin archive
    .DESCRIPTION
        This function returns the encrypted intunewin file from inside the outer intunewin archive
    .EXAMPLE
        Get-IntuneWinFile -SourceFile Package.intunewin -FileName 'IntunePackage.intunewin'
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function returns the IntunePackage.intunewin from
    .NOTES
        NAME: Get-IntuneWinFile
    #>
    param(
        # The source intunewin file (outer archive not the encrypted one)
        [Parameter(Mandatory = $true)]
        [string] $SourceFile,
        # The filename for the internal encrypted intunewin file
        [Parameter(Mandatory = $false)]
        [string] $FileName = "IntunePackage.intunewin"
    )

    $Directory = New-TemporaryFolder

    Add-Type -Assembly System.IO.Compression.FileSystem
    $zip = [IO.Compression.ZipFile]::OpenRead("$SourceFile")

    $zip.Entries | Where-Object { $_.Name -like "$Filename" } | ForEach-Object {
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_, "$Directory\$Filename", $true)
    }

    $zip.Dispose()

    return "$Directory\$Filename"
}