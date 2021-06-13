function Get-Module-Not-Installed($module) {
    return -not(Get-InstalledModule $module -ErrorAction silentlycontinue)
}
function Test-CommandMissing($command) {

    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = "stop"

    try { if (Get-Command $command) { return $false } }
    catch { }
    finally { $ErrorActionPreference = $oldPreference }

    return $true
}

if (Get-Module-Not-Installed PSReadLine) {
    Install-Module PSReadLine -AllowPrerelease -Force
}

if (Get-Module-Not-Installed posh-git) {
    Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
}

if (Get-Module-Not-Installed Terminal-Icons) {
    Install-Module -Name Terminal-Icons -Repository PSGallery
}

if (Get-Module-Not-Installed oh-my-posh) {
    Install-Module -Name oh-my-posh
}

if ($IsWindows) {
    if (Test-CommandMissing scoop) {
        Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
        scoop bucket add extras
        scoop bucket add nerd-fonts
    } 

    scoop install FiraCode-NF ripgrep powertoys cloc gh micro fzf bat neofetch tre-command zoxide
}

if ($IsMacOS) {
    brew tap homebrew/cask-fonts
    brew install --cask font-FiraCode-nerd-font
    brew install ripgrep cloc gh micro fzf bat neofetch tre-command zoxide
}