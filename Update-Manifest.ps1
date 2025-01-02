param (
    [Parameter(Mandatory = $false)]
    [string] $Module = 'IntuneGraph',
    [Parameter(Mandatory = $false)]
    [version] $ModuleVersion 
)

$manifestPath = "$Module\$Module.psd1"

$OldModuleManifest = Import-PowerShellDataFile $manifestPath

$publicFunctions = @()
Get-ChildItem -Path "$Module\Public\*.ps1" -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
    $publicFunctions += $_.BaseName
}

$params = @{
    Path              = $manifestPath
    FunctionsToExport = $publicFunctions
}

if ($PSBoundParameters.ContainsKey('ModuleVersion')) {
    if ([version]$ModuleVersion -le [version]$OldModuleManifest.ModuleVersion) {
        return $false
    }
    $params.ModuleVersion = $ModuleVersion
}

Update-ModuleManifest @params
return $true