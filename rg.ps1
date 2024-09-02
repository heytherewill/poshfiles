function rgf {
    $input | rg --files | rg $args
}

function rgf! {
    $input | rg --files --no-ignore | rg $args
}

function rgfo {
    $files = $input | rg --files | rg $args
    Invoke-Code($files)
}

function rgfoa {
    $input | rg --files | rg -l $args | ForEach-Object { Invoke-Code($_) }
}

function rgo {
    $files = rg -l $args
    Invoke-Code($files)
}

function rgoa {
    rg -l $args | ForEach-Object { Invoke-Code($_) }
}

function Invoke-Code($files) {
    if ($null -eq $files) {
        # Nothing was found
        Write-Output "No matches for this pattern"
    } elseif ($files.GetType().Name -eq "String") {
        # If there's only one result we can just open it.
        code ($files)
    } elseif ($files.Length -gt 1) {
        # Otherwise we open a picker, if there are multiple choices.
        $pickedFile = $files | fzf
        if ($null -ne $pickedFile) {
            code $pickedFile
        }
    }
}