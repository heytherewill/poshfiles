Remove-Item alias:gcb -Force
Remove-Item alias:gcm -Force
Remove-Item alias:gp -Force

function ga($file) {
    git add $file
}

function gaa() {
    git add -A
}

function gap($file) {
	git add -p $file
}

function gcb($branchName) {
    git checkout -b $branchName
}

function gspull($branchName) {
    gs
    git pull
    gsp
}

function gsw($branchName) {
    git switch $branchName
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

function grh($size) {
    git reset HEAD~$size
}

function gri($size) {
    git rebase -i HEAD~$size
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
	git status
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
