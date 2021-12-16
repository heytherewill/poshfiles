Remove-Item alias:gcb -Force
Remove-Item alias:gcm -Force
Remove-Item alias:gp -Force

function ga($file) {
    if ($null -eq $file) {
        (gst -Split [System.Environment]::NewLine) 
        | Where-Object { !$_.StartsWith("##") }
        | fzf -m
        | ForEach-Object { git add $_.Substring(3, $_.Length - 3) }
    } else {
        git add $file
    }
}

function gaa() {
    git add -A
}

function gap($file) {
	git add -p $file
}

function gbclean() {
    git branch --merged | rg -v "(^\*|master|main|dev)" | ForEach-Object { git branch -d $_.Trim() }
}

function gcb($branchName) {
    git checkout -b $branchName
}

function gfix() {
    $commitHash = (git log -n 50 --pretty=format:'%h %s' --no-merges | fzf)

    if ($null -eq $commitHash) {
        Write-Output "Operation cancelled"
    } else {
        git commit --fixup $commitHash.Substring(0, 7)
    }
}

function gspull($branchName) {
    gs
    git pull
    gsp
}

function gsw($branchName) {
    $branchName ??= (git branch --list | rg -v "(^\*)" | fzf)
    
    if ($null -eq $branchName) {
        Write-Output "Operation cancelled"
    } else {
        git switch $branchName.Trim()
    }
}

function gcm($message) {
    git commit -m $message
}

function gcma($message) {
    gaa
    git commit -m $message
}

function glog() {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

function gnuke($file) {
    if ($null -eq $file) {
        gaa
        git reset --hard HEAD
        git clean -f
    } else {
        git restore $file
    }
}

function gpf() {
    git push -f
}

function gpr() {
    git push --set-upstream origin (git branch --show-current)
}

function grh($size) {
    git reset HEAD~$size
}

function gri($size) {
    git rebase -i --autosquash HEAD~$size
}

function grif($size) {
    gs
    git rebase -i HEAD~$size
    gsp
}

function gs() {
    gaa
    git stash
}

function gsp() {
    git stash pop
}

function gst() {
	git status -sb
}

function gwip() {
    gcma(":construction: WIP")
}

function gp() {
    git push
}

function gpl() {
    git pull
}

function gpatch() {
    git diff | Set-Clipboard
}

function vpr() {
    gh pr view --web
}