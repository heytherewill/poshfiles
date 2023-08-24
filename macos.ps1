if ($IsM1) {
    $env:CPATH = "/opt/homebrew/include"
    $env:LIBRARY_PATH = "/opt/homebrew/lib"
}

# Needed for CocoaPods
$env:LANG="en_US.UTF-8"
$env:LC_ALL="en_US.UTF-8"