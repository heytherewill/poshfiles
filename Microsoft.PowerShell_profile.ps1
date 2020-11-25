$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. "$root/android.ps1"
. "$root/git.ps1"
. "$root/terminal.ps1"
Clear-Host