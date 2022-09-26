function up($amount) {
    if ($amount -eq $null) {
        Set-Location ..
    } else {
        For ($i=0; $i -lt $amount; $i++) {
            Set-Location ..
        }
    }
}

function back() {
    z -
}

function err() {
    Write-Output $error
}

function into-temp {
    $input | Out-File -Path "temp.txt"
}

function temp {
    code temp.txt
}