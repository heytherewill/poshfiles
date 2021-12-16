Set-Alias open 'explorer.exe'
Remove-Item alias:pwd -Force

function bin() {
    open shell:RecycleBinFolder
}

function pwd() {
    (Get-Location) -Split [System.Environment]::newline | ? { ![System.String]::IsNullOrEmpty($_) }
}

function ccd() {
    pwd | Set-Clipboard
}

function mklink() {
    cmd /c mklink $args
}

function touch($fileName) {
    fsutil file createnew $fileName 0
}