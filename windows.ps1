Set-Alias open 'explorer.exe'

function bin() {
    open shell:RecycleBinFolder
}

function touch($fileName) {
    fsutil file createnew $fileName 0
}

function mklink() {
    cmd /c mklink $args
}