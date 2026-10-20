param([ValidateSet('codex','opencode')][string]$Target='codex')
$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
$base = if ($Target -eq 'codex') { Join-Path $env:USERPROFILE '.codex\skills' } else { Join-Path $env:USERPROFILE '.config\opencode\skills' }
Get-ChildItem (Join-Path $repo 'skills') -Directory | ForEach-Object {
  $dest = Join-Path $base $_.Name
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  Copy-Item (Join-Path $_.FullName '*') $dest -Recurse -Force
  Write-Output "Installed $($_.Name) to $dest"
}
