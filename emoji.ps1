# Prepare file
$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$emojiFile = "$root/emoji.json"
if ((Test-Path $emojiFile) -eq $false) {
  Invoke-RestMethod "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json" | ConvertTo-Json | Out-File -FilePath $emojiFile
}

$emojiList = @()
$emojiTable = @{}
$rawEmojiData = Get-Content $emojiFile | ConvertFrom-Json

$emojiList = $rawEmojiData | ForEach-Object { $_.aliases }
$emojiTable = @{}
foreach ($emojiInfo in $rawEmojiData) {
    foreach($alias in $emojiInfo.aliases) {
        $emojiTable[$alias] = $emojiInfo.emoji
    }
}

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
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($emojiTable[$pickedEmoji])
}