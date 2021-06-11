function up($amount) {
    if ($amount -eq $null) {
        Set-Location ..
    } else {
        For ($i=0; $i -lt $amount; $i++) {
            Set-Location ..
        }
    }
}