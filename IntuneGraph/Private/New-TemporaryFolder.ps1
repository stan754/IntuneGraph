Function New-TemporaryFolder {
  $T="$($Env:temp)\tmp$([convert]::tostring((get-random ([uint32]::MaxValue)),16).padleft(8,'0'))"
  New-Item -ItemType Directory -Path $T
}