Set-Alias open 'explorer.exe'

function touch($fileName) {
    fsutil file createnew $fileName 0
}