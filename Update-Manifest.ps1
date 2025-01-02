param (
    [Parameter(Mandatory = $false)]
    [string] $Module = 'IntuneGraph',
    [Parameter(Mandatory = $false)]
    [version] $ModuleVersion 
)

$publicFunctions = @()
Get-ChildItem -Path "$Module\Public\*.ps1" -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
    $publicFunctions += $_.BaseName
}

$params = @{
    Path                 = "$Module\$Module.psd1"
    FunctionsToExport    = $publicFunctions
}

if ($PSBoundParameters.ContainsKey('ModuleVersion')) {
    $params.ModuleVersion = $ModuleVersion
}

Update-ModuleManifest @params