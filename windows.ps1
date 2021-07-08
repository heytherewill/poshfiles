Set-Alias open 'explorer.exe'

function bin() {
    open shell:RecycleBinFolder
}

function ccd() {
    $prefix = "        Directory: "
    
    Get-ChildItem 
    | rg $prefix
    | ForEach-Object { $_.Substring($prefix.Length, $_.Length - $prefix.Length)  }
    | Set-Clipboard
}

function mklink() {
    cmd /c mklink $args
}

function touch($fileName) {
    fsutil file createnew $fileName 0
}