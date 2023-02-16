$pathSeparator = If ($IsWindows) {";"} Else {":"}

$IsM1 = $IsMacOS -and ((uname -a) -Split " " | Select-Object -Last 1) -eq "arm64"