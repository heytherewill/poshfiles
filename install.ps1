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

if (Get-Module-Not-Installed PSFzf) {
    Install-Module -Name PSFzf
}

if ($IsWindows) {
    if (Test-CommandMissing scoop) {
        Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
        scoop bucket add extras
        scoop bucket add nerd-fonts
        scoop bucket add java
    } 

    scoop install FiraCode-NF ripgrep powertoys tokei gh micro fzf bat neofetch tre-command zoxide grex openjdk11 oh-my-posh
}

if ($IsMacOS) {
    brew tap homebrew/cask-fonts
    brew install --cask font-FiraCode-nerd-font
    brew install ripgrep tokei gh micro fzf bat neofetch tre-command zoxide grex openjdk@11 jandedobbeleer/oh-my-posh/oh-my-posh
}

Write-Host ""
Write-Host "Installation finished." -ForegroundColor Green
Write-Host "Now click these links and install the relevant Catppuccin Macchiato themes" -ForegroundColor Green
Write-Host "https://github.com/catppuccin/jetbrains" -ForegroundColor Blue
Write-Host "https://github.com/catppuccin/vscode-pack" -ForegroundColor Blue
Write-Host "https://github.com/catppuccin/firefox" -ForegroundColor Blue
Write-Host "https://github.com/catppuccin/duckduckgo" -ForegroundColor Blue
Write-Host "https://github.com/catppuccin/slack" -ForegroundColor Blue
Write-Host "https://github.com/catppuccin/telegram" -ForegroundColor Blue

if ($IsWindows) {
    Write-Host "https://github.com/catppuccin/visual-studio" -ForegroundColor Blue
    Write-Host "https://github.com/catppuccin/windows-terminal" -ForegroundColor Blue
}

if ($IsMacOS) {
    Write-Host "https://github.com/catppuccin/iterm" -ForegroundColor Blue
}