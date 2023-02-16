$androidSdkPath = 
    If ($IsWindows) { "%localappdata%\Android\Sdk" }
    Else { "/Users/$(whoami)/Library/Android/sdk" }

$env:ANDROID_HOME=$androidSdkPath
$env:ANDROID_SDK_ROOT=$androidSdkPath
$env:PATH="$($env:PATH)$($pathSeparator)$($androidSdkPath)/tools$($pathSeparator)$($androidSdkPath)/platform-tools"

function adbtrace() {
    adb pull /data/local/traces/
}
