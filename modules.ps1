function Get-Module-Not-Installed($module) {
    return -not(Get-InstalledModule $module -ErrorAction silentlycontinue)
}

if (Get-Module-Not-Installed PSReadLine) {
    Install-Module PSReadLine -AllowPrerelease -Force
}

if (Get-Module-Not-Installed posh-git) {
    Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
}

if (Get-Module-Not-Installed ZLocation) {
    Install-Module ZLocation -Scope CurrentUser
}

if (Get-Module-Not-Installed Terminal-Icons) {
    Install-Module -Name Terminal-Icons -Repository PSGallery
}
