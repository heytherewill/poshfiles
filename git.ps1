function gaa() {
    git add -A
}

function gp() {
    git push
}

function gpf() {
    git push -f
}

function gcm($message) {
    git commit -m $message
}

function gca($message) {
    gaa
    git commit -m $message
}

function gnuke() {
    git reset --hard HEAD 
    git clean -f 
}

function gwip() {
    gca(":construction: WIP")
}

function gri($size) {
    git rebase -i HEAD~$size
}

function grh($size) {
    git reset HEAD~$size
function gs() {
    gaa
    git stash
}
}