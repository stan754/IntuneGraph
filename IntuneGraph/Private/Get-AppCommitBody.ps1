function Get-AppCommitBody {
  param(
    [Parameter(Mandatory = $true)]
    [string] $contentVersionId,
    [Parameter(Mandatory = $true)] 
    [string] $LobType
  )
  $body = @{ "@odata.type" = "#$LobType" }
  $body.committedContentVersion = $contentVersionId

  $body
}