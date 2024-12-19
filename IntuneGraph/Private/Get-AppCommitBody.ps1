function Get-AppCommitBody {
  <#
  .SYNOPSIS
      This function returns a committedContentVersion body
  .DESCRIPTION
      This function returns a committedContentVersion body
  .EXAMPLE
      Get-AppCommitBody -ContentVersionId $id -LobType "microsoft.graph.win32LobApp"
  .INPUTS
      None. No objects can be piped into this function
  .OUTPUTS
      This function returns the committedContentVersion body
  .NOTES
      NAME: Get-AppCommitBody
  #>
  param(
    # The content version ID
    [Parameter(Mandatory = $true)]
    [string] $ContentVersionId,
    # The LOB type
    [Parameter(Mandatory = $true)]
    [string] $LobType
  )
  $body = @{ "@odata.type" = "#$LobType" }
  $body.committedContentVersion = $ContentVersionId

  $body
}