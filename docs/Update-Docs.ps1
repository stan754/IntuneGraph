Import-Module platyPS -Force
Import-Module "$PSScriptRoot\..\IntuneGraph" -Force

$null = Update-MarkdownHelpModule -Path "$PSScriptRoot\Public"

Get-ChildItem -Path .\IntuneGraph\Private\ -Recurse | ForEach-Object {
  . $_
  $null = New-MarkdownHelp -Command $_.BaseName -OutputFolder ".\docs\Private" -NoMetadata -Force   
}