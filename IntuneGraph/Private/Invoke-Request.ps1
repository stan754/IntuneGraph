function Invoke-Request {
  param (
    [Parameter(Mandatory = $true)]
    [string] $Verb, 
    [Parameter(Mandatory = $true)]
    [string] $CollectionPath, 
    [Parameter(Mandatory = $false)]
    [string] $Body,
    [Parameter(Mandatory = $false)]
    [string] $BaseUrl = "https://graph.microsoft.com/beta/deviceAppManagement/"
  )

  $uri = "$BaseUrl$collectionPath"
  $request = "$verb $uri"

  if ($PSBoundParameters.ContainsKey('Body')) {
    $params = @{
      Uri = $uri
      Method = $Verb
      Body = $Body
      ContentType = 'application/json'
    }
  }
  else {
    $params = @{
      Uri = $uri
      Method = $Verb
    }
  }

  try {
    $response = Invoke-MgGraphRequest @params
    $response
  }
  catch {
    Write-Host -ForegroundColor Red $request
    Write-Host -ForegroundColor Red $_.Exception.Message
    throw
  }
}