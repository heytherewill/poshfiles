# My aliases and custom scripts
$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$root/env.ps1"
. "$root/android.ps1"
. "$root/dotnet.ps1"
. "$root/git.ps1"
. "$root/terminal.ps1"
. "$root/typo.ps1"
. "$root/rg.ps1"
. "$root/spotify.ps1"

if ($IsWindows) {
  . "$root/windows.ps1"
}

if ($IsMacOS) {
  . "$root/macos.ps1"
}

# Git support
Import-Module posh-git

# Command line editing
Import-Module PSReadLine
. "$root/psreadline.ps1"

# Prompt
oh-my-posh init pwsh --config $root/heytherewill.omp.json | Invoke-Expression

# zoxide
Invoke-Expression (& { (zoxide init --hook 'pwd' powershell | Out-String) })

# Fish-like autocompletion
set-psreadlineoption -predictionsource history

# Pretty icons
Import-Module -Name Terminal-Icons

# Better history search
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Emoji autocompletion
Import-Module PSFzf
. "$root/emoji.ps1"

Clear-Host

# Help tips so I don't forget all things I can use
. "$root/tips.ps1"
$tips | Get-Random | Write-Output