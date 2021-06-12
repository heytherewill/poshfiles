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

if (Get-Module-Not-Installed ZLocation) {
    Install-Module ZLocation -Scope CurrentUser
}

if (Get-Module-Not-Installed Terminal-Icons) {
    Install-Module -Name Terminal-Icons -Repository PSGallery
}

if (Get-Module-Not-Installed oh-my-posh) {
    Install-Module -Name oh-my-posh
}

if ($IsWindows) {
    if (Test-CommandMissing choco) {
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    } 

    choco install ripgrep sudo powertoys cloc gh micro fzf
}

if ($IsMacOS) {
    brew install ripgrep cloc gh micro fzf
}