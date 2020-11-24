$adbIsInPath = $env:Path -like "*Android\Sdk\platform-tools*"

if (!$adbIsInPath) {
    $env:Path += ";%localappdata%\Android\Sdk\platform-tools"
}

function aft() {
    Set-Location $env:UserProfile/Documents
    adb pull /data/local/traces/
}