Set-Alias gaa 'git add -A'

function gcm($message) {
    git commit -m $message
}

function gca($message) {
    git add -A
    git commit -m $message
}

function gwip() {
    gca(":construction: WIP")
}

function gri($size) {
    git rebase -i HEAD~$size
}

function grh($size) {
    git reset HEAD~$size
}