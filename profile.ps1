# My aliases and custom scripts
$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$root/android.ps1"
. "$root/git.ps1"
. "$root/terminal.ps1"
. "$root/rg.ps1"

if ($IsWindows) {
  . "$root/windows.ps1"
}

# Git support
Import-Module posh-git

# Command line editing
Import-Module PSReadLine

# zoxide
Invoke-Expression (& {
  (zoxide init --hook 'pwd' powershell) -join "`n"
})

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
