# JurisAtlas Interactive Country & AI Client Setup (Windows PowerShell - No Git Required)
$ErrorActionPreference = "Stop"

$UvExe = $null
foreach ($p in @("$env:USERPROFILE\.local\bin\uvx.exe", "$env:LOCALAPPDATA\uv\uvx.exe")) {
    if (Test-Path $p) { $UvExe = $p; break }
}
if (-not $UvExe) {
    $cmd = Get-Command uvx -ErrorAction SilentlyContinue
    if ($cmd) { $UvExe = $cmd.Source }
}
if (-not $UvExe) {
    Write-Host "Installing uv package runner..." -ForegroundColor Cyan
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
    $UvExe = "$env:USERPROFILE\.local\bin\uvx.exe"
}

& $UvExe --from https://github.com/jurisatlas/cli/archive/refs/heads/main.zip jurisatlas
