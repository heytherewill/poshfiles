# My aliases and custom scripts
$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$root/android.ps1"
. "$root/git.ps1"
. "$root/terminal.ps1"
. "$root/rg.ps1"

if ($IsWindows) {
  . "$root/windows.ps1"
}

# Package Manager
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Git support
Import-Module posh-git

# Command line editing
Import-Module PSReadLine

# z to jump around
Import-Module ZLocation

# Prompt
Import-Module oh-my-posh
Set-PoshPrompt "$root/heytherewill.omp.json"

# Fish-like autocompletion
set-psreadlineoption -predictionsource history

# Pretty icons
Import-Module -Name Terminal-Icons

# Better history search
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Clear-Host
