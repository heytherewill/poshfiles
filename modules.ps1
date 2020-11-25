function Get-Module-Not-Installed($module) {
    return -not(Get-InstalledModule $module -ErrorAction silentlycontinue)
}

if (Get-Module-Not-Installed posh-git) {
    Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
}

if (Get-Module-Not-Installed ZLocation) {
    Install-Module ZLocation -Scope CurrentUser
}
