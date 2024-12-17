Function Test-SourceFile {
    param (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        $SourceFile
    )

    try {
        if (!(test-path "$SourceFile")) {
            throw "Source File '$sourceFile' doesn't exist..."
        }
    }

    catch {
        throw "$($_.Exception.Message)"
    }
}