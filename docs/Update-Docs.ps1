Install-Module platyPS -Force
Import-Module platyPS -Force
Import-Module "$PSScriptRoot\..\IntuneGraph" -Force

$null = Update-MarkdownHelpModule -Path "$PSScriptRoot\Public"

$TempModulePath = Join-Path ([system.io.path]::GetTempPath()) "TempModule.psm1"
$TempModuleContent = @"
`$Private = @( Get-ChildItem -Path $PSScriptRoot\..\IntuneGraph\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

Foreach (`$import in `$Private) {
    Try {
        . `$import.FullName
    }
    Catch {
        Write-Error -Message "Failed to import function `$(`$import.fullname): `$_"
    }
}

Export-ModuleMember -Function `$Private.Basename
"@

Set-Content -Path $TempModulePath -Value $TempModuleContent -Force
Import-Module $TempModulePath -Force

$null = New-MarkdownHelp -Module TempModule -OutputFolder "$PSScriptRoot\Private" -NoMetadata -Force

Remove-Module TempModule -Force
Remove-Item $TempModulePath -Force