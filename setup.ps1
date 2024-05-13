$ConfigDir = "$env:APPDATA"
$SourceDir = "$PSScriptRoot\config"

Write-Host "start setup dotfiles"

if (-not (Test-Path -Path $ConfigDir -PathType Container)) {
	New-Item -Path $ConfigDir -ItemType Directory | Out-Null
}

Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
Move-Item $env:LOCALAPPDATA\helix $env:LOCALAPPDATA\helix.bak

Copy-Item -Path "$SourceDir\nvim" -Destination "$ConfigDir\" -Recurse
Copy-Item -Path "$SourceDir\helix" -Destination "$ConfigDir\" -Recurse
Write-Host "done"
