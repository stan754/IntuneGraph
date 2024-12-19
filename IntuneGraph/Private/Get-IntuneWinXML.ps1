function Get-IntuneWinXML {
    <#
    .SYNOPSIS
        This function returns the detection.xml from inside the outer intunewin archive
    .DESCRIPTION
        This function returns the detection.xml from inside the outer intunewin archive
    .EXAMPLE
        Get-IntuneWinXML -SourceFile Package.intunewin -FileName 'detection.xml'
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function returns the detection.xml from the intunewin archive
    .NOTES
        NAME: Get-IntuneWinXML
    #>
    param(
        # The source intunewin file (outer archive not the encrypted one)
        [Parameter(Mandatory = $true)]
        [string] $SourceFile,
        # The filename for the xml to read
        [Parameter(Mandatory = $false)]
        [string] $FileName = "detection.xml"
    )

    Test-SourceFile "$SourceFile"

    try {
        Add-Type -Assembly System.IO.Compression.FileSystem
        $archive = [System.IO.Compression.ZipFile]::OpenRead($SourceFile)
        $file = $archive.Entries | Where-Object { $_.Name -eq $FileName }
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