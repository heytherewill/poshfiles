Set-Alias open 'explorer.exe'

function bin() {
    open shell:RecycleBinFolder
}

function touch($fileName) {
    fsutil file createnew $fileName 0
}

function up($amount) {
    For ($i=0; $i -lt $amount; $i++) {
        Set-Location ..
    }
}
