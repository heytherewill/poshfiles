# Prepare file
$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$emojiFile = "$root/emoji.json"
if ((Test-Path $emojiFile) -eq $false) {
  Invoke-RestMethod "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json" | ConvertTo-Json | Out-File -FilePath $emojiFile
}

$rawEmojiData = Get-Content $emojiFile | ConvertFrom-Json

$emojiList = $rawEmojiData | ForEach-Object { $_.aliases }
$emojiTable = @{}
foreach ($emojiInfo in $rawEmojiData) {
    foreach($alias in $emojiInfo.aliases) {
        $emojiTable[$alias] = $emojiInfo.emoji
    }
}

function emojify {
    $text = $input
    foreach ($emoji in $emojiList) {
        $text = $text.Replace(":${emoji}:", $emojiTable[$emoji])
    }

    Write-Output $text
}

# Set autocompletion
Set-PSReadLineKeyHandler -Chord 'Shift+<' `
                         -BriefDescription GithubEmojiAutocompletion `
                         -LongDescription "Autocomplete github emoji" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    $pickedEmoji = $emojiList | Invoke-Fzf

    $textToInject = if ($null -eq $pickedEmoji) { "<" } else { $emojiTable[$pickedEmoji] }
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($textToInject)
}
