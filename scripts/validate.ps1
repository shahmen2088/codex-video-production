$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$plugin = Get-Content -Raw (Join-Path $root 'plugin.json') | ConvertFrom-Json
$compat = Get-Content -Raw (Join-Path $root '.codex-plugin\plugin.json') | ConvertFrom-Json
$null = Get-Content -Raw (Join-Path $root 'opencode.json') | ConvertFrom-Json
$cases = Get-Content -Raw (Join-Path $root 'tests\activation-cases.md')
$skills = Get-ChildItem (Join-Path $root 'skills') -Directory
if ($plugin.'$schema' -ne 'https://agent-plugins.org/schemas/1.0.0/plugin.schema.json') { throw 'Missing portable plugin schema' }
if ($compat.name -ne $plugin.name -or $compat.version -ne $plugin.version) { throw 'Compatibility manifest identity mismatch' }
if ($compat.skills -ne './skills/') { throw 'Compatibility manifest must point to ./skills/' }
$onboarding = $plugin.extensions.'com.openai'.onboardingSkill
if (-not $onboarding -or -not (Test-Path (Join-Path $root $onboarding))) { throw 'Invalid onboarding skill path' }
if ($skills.Count -eq 0) { throw 'No skills found' }
foreach ($dir in $skills) {
  $text = Get-Content -Raw (Join-Path $dir.FullName 'SKILL.md')
  if ($text -notmatch '(?m)^name:\s*([a-z0-9]+(?:-[a-z0-9]+)*)\s*$') { throw "Missing valid name: $($dir.Name)" }
  if ($Matches[1] -ne $dir.Name) { throw "Name mismatch: $($dir.Name)" }
  if ($text -notmatch '(?m)^description:\s*\S.+$') { throw "Missing description: $($dir.Name)" }
  if ($text -match 'TODO|TBD') { throw "Placeholder found: $($dir.Name)" }
  if ($cases -notmatch [regex]::Escape("## $($dir.Name)")) { throw "Missing activation cases: $($dir.Name)" }
}
if (-not (Test-Path (Join-Path $root 'LICENSE'))) { throw 'Missing LICENSE' }
Write-Output "PASS: $($skills.Count) skills validated"
