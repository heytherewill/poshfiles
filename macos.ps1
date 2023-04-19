if ($IsM1) {
    $env:CPATH = "/opt/homebrew/include"
    $env:LIBRARY_PATH = "/opt/homebrew/lib"
}

$env:JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
$env:JAVA_11_HOME=$(/usr/libexec/java_home -v11)
$env:JAVA_18_HOME=$(/usr/libexec/java_home -v11)

function java11() {
    $env:JAVA_HOME = $env:JAVA_11_HOME
}

function java18() {
    $env:JAVA_HOME = $env:JAVA_18_HOME
}

$env:JAVA_HOME=$env:JAVA_11_HOME