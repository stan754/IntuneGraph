function Get-HelpObject {
  param (
    [Parameter(Mandatory = $true)]
    [string] $CommandName
  )

  $Help = Get-Help $CommandName -Full
  $Command = Get-Command $CommandName

  $name = $Help.Name
  $synopsis = $Help.Synopsis
  $syntax = ($Help.Syntax | Out-String).Trim()
  $description = ($Help.Description | Out-String).Trim()
  $examples = @()
  $Help.examples.example | ForEach-Object {
    $examples += [PSCustomObject]@{
      Title = ($_.title -replace '-', '' | Out-String).Trim()
      Code  = $_.code
    }
  }
  $parameters = @()
  $ParameterSets = $Command.ParameterSets | Select-Object -Property @{n = 'ParameterSetName'; e = { $_.name } }, @{n = 'Parameters'; e = { $_ } }
  if ($Help.parameters.parameter) {
    $Help.parameters.parameter | ForEach-Object {
      $ParamName = $_.name
      $ParameterSet = $ParameterSets | Where-Object { $_.Parameters.Parameters.Name -contains $ParamName } | Select-Object -ExpandProperty ParameterSetName
      if ($ParameterSet.Count -eq $ParameterSets.Count) {
        $ParameterSet = "(All)"
      }
      else {
        $ParameterSet = $ParameterSet -join ", "
      }
      $position = ($_.position | Out-String).Trim()
      if ($position -like 'named') {
        $position = 'Named'
      }
      $defaultValue = ($_.defaultValue | Out-String).Trim()
      if ([string]::IsNullOrEmpty($defaultValue)) {
        $defaultValue = 'None'
      }

      $parameters += [PSCustomObject]@{
        Name           = "-$($_.name)"
        Description    = ($_.Description | Out-String).Trim()
        Type           = ($_.type.name | Out-String).Trim()
        ParameterSets  = $ParameterSet
        Aliases        = ($Command.Parameters[$ParamName].Aliases -join ", ")
        Required       = ($_.required.ToString() -replace '^.', { $_.Value.ToUpper() }).Trim()
        Position       = $position
        DefaultValue   = $defaultValue
        AcceptPipeline = ($_.pipelineInput.ToString() -replace '^.', { $_.Value.ToUpper() }).Trim()
        AcceptWildcard = ($_.globbing.ToString() -replace '^.', { $_.Value.ToUpper() }).Trim()
      }
    }
  }
  else {
    $parameters = $null
  }
  $commonParams = $Command.Parameters.Keys | Where-Object { ($_ -in [System.Management.Automation.PSCmdlet]::CommonParameters) -or ($_ -in [System.Management.Automation.PSCmdlet]::OptionalCommonParameters) } 
  if ($commonParams.Count -ge 1) {
    $commonParams = (($commonParams | ForEach-Object { "-$_" })[0..$($commonParams.Count - 2)] -join ", ") + ", and -" + $commonParams[-1]
  }
  else {
    $commonParams = $null
  }
  $inputs = ($Help.inputTypes | Out-String).Trim()
  $outputs = ($Help.returnValues | Out-String).Trim()
  $notes = ($Help.alertSet.alert | Out-String).Trim()
  $relatedLinks = @()
  ($Help.relatedLinks | Out-String).Trim() -split "`n" | ForEach-Object {
    $link = $_.Trim()
    if ($link -match '^https?://') {
      $link = "[$link]($link)"
    }
    else {
      if ($link -match '^([^:]+):\s*(https?://[^\s]+)') {
        $prefix = $matches[1]
        $url = $matches[2]
        $link = "[$prefix]($url)"
      }
    }
    $relatedLinks += $link
  }


  [PSCustomObject]@{
    Name         = $name
    Synopsis     = $synopsis
    Syntax       = $syntax
    Description  = $description
    Examples     = $examples
    Parameters   = $parameters
    CommonParams = $commonParams
    Inputs       = $inputs
    Outputs      = $outputs
    Notes        = $notes
    RelatedLinks = $relatedLinks
  }
}

function New-MarkdownDoc {
  param (
    [Parameter(Mandatory = $true)]
    [string] $CommandName,
    [Parameter(Mandatory = $false)]
    [string[]] $Tags,
    [Parameter(Mandatory = $true)]
    [string] $OutputFolder
  )
  $Help = Get-HelpObject -CommandName $CommandName
  $output = @()

  if ($Tags) {
    $output += "---"
    $output += "tags:"
    $Tags | ForEach-Object {
      $output += "- $_"
    }
    $output += "---"
  }

  $output += "# $($Help.Name)"
  $output += ""

  $output += "## SYNOPSIS"
  $output += $Help.Synopsis
  $output += ""

  $output += "## SYNTAX"
  $output += '```powershell'
  $output += $Help.Syntax
  $output += '```'
  $output += ""

  $output += "## DESCRIPTION"
  $output += $Help.description
  $output += ""

  $output += "## EXAMPLES"
  $output += ""
  $Help.Examples | ForEach-Object {
    $output += "### $($_.Title)"
    $output += '```powershell'
    $output += $_.Code
    $output += '```'
    $output += ""
  }
  
  if ($null -ne $Help.Parameters) {
    $output += "## PARAMETERS"
    $output += ""

    $Help.Parameters | ForEach-Object {
      $output += "### $($_.Name)"
      $output += $_.Description
      $output += ""
      $output += '```yaml'
      $output += "Type: $($_.Type)"
      $output += "Parameter Sets: $($_.ParameterSets)"
      $output += "Aliases: $($_.Aliases)"
      $output += ""
      $output += "Required: $($_.Required)"
      $output += "Position: $($_.Position)"
      $output += "Default value: $($_.DefaultValue)"
      $output += "Accept pipeline input: $($_.AcceptPipeline)"
      $output += "Accept wildcard characters: $($_.AcceptWildcard)"
      $output += '```'
      $output += ""
    }
  }

  if ($null -ne $Help.CommonParams) {
    $output += "### CommonParameters"
    $output += "This cmdlet supports the common parameters: $($Help.CommonParams). For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216)."
    $output += ""
  }

  $output += "## INPUTS"
  $output += "### $($Help.Inputs)"
  $output += ""

  $output += "## OUTPUTS"
  $output += "### $($Help.Outputs)"
  $output += ""

  $output += "## NOTES"
  $output += $Help.Notes
  $output += ""

  $output += "## RELATED LINKS"
  $Help.RelatedLinks | ForEach-Object {
    $output += $_
  }

  $output | Out-File "$OutputFolder\$CommandName.md"
}

$ReferenceDocsPath = "$PSScriptRoot\..\docs\Reference"

Remove-Item $ReferenceDocsPath -Force -Recurse

if (-not (Test-Path "$ReferenceDocsPath")) {
  $null = New-Item "$ReferenceDocsPath" -ItemType Directory -Force
}
if (-not (Test-Path "$ReferenceDocsPath\Public")) {
  $null = New-Item "$ReferenceDocsPath\Public" -ItemType Directory
}
if (-not (Test-Path "$ReferenceDocsPath\Private")) {
  $null = New-Item "$ReferenceDocsPath\Private" -ItemType Directory
}

$Public = @( Get-ChildItem -Path $PSScriptRoot\..\IntuneGraph\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\..\IntuneGraph\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

Foreach ($import in @($Public + $Private)) {
  Try {
    . $import.FullName
  }
  Catch {
    Write-Error -Message "Failed to import function $($import.FullName): $_"
  }
}

$Private | ForEach-Object {
  New-MarkdownDoc -CommandName $_.BaseName -OutputFolder "$ReferenceDocsPath\Private" -Tags "Private"
}

$Public | ForEach-Object {
  New-MarkdownDoc -CommandName $_.BaseName -OutputFolder "$ReferenceDocsPath\Public" -Tags "Public"
}

"nav:`n`t- Public`n`t-Private" | Out-File "$ReferenceDocsPath\.pages"
