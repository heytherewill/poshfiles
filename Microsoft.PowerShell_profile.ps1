$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$root/android.ps1"
. "$root/git.ps1"
. "$root/terminal.ps1"

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module posh-git
Clear-Host