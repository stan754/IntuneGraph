Function New-TemporaryFolder {
  <#
  .SYNOPSIS
      This function creates a new temporary folder just like New-TemporaryFile
  .DESCRIPTION
      This function creates a new temporary folder just like New-TemporaryFile
  .EXAMPLE
      New-TemporaryFolder
  .INPUTS
      None. No objects can be piped into this function
  .OUTPUTS
      A new folder in the temporary directory
  .NOTES
      NAME: New-TemporaryFolder
  #>
  $TempName = [convert]::tostring((get-random ([uint32]::MaxValue)),16).padleft(8,'0')
  $TempFolder = "$($Env:temp)\tmp$TempName"
  New-Item -ItemType Directory -Path $TempFolder
}