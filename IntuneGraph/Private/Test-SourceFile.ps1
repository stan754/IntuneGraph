function Test-SourceFile {
    <#
    .SYNOPSIS
        This function tests if a file exists or not
    .DESCRIPTION
        This function tests if a file exists or not
    .EXAMPLE
        Test-SourceFile -SourceFile Package.intunewin
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        None. This function returns nothing
    .NOTES
        NAME: Test-SourceFile
    #>
    param (
        # The path to the source file to test
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $SourceFile
    )

    try {
        if (-not (Test-Path "$SourceFile")) {
            throw "Source File '$SourceFile' doesn't exist..."
        }
    }

    catch {
        throw "$($_.Exception.Message)"
    }
}