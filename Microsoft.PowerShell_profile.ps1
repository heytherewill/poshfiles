$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$root/android.ps1"
. "$root/git.ps1"
. "$root/terminal.ps1"

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module posh-git
Import-Module PSReadLine
Import-Module ZLocation
Invoke-Expression (&starship init powershell)

# Fish-like autocompletion
set-psreadlineoption -predictionsource history

# Better history search
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Clear-Host