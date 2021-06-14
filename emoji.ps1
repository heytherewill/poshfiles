# Prepare file
$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$emojiFile = "$root/emoji.json"
if ((Test-Path $emojiFile) -eq $false) {
  Invoke-RestMethod "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json" | ConvertTo-Json | Out-File -FilePath $emojiFile
}

$emojiList = Get-Content $emojiFile | ConvertFrom-Json | ForEach-Object { $_.aliases }

# Set autocompletion
Set-PSReadLineKeyHandler -Chord 'Shift+:' `
                         -BriefDescription GithubEmojiAutocompletion `
                         -LongDescription "Autocomplete github emoji" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    $pickedEmoji = $emojiList | fzf
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)")
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($pickedEmoji)
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar) ")
}