function rgf($search) {
    rg --files | rg $search
}

function rgl() {
    rg --l $search
}

function rgeach($search, $command) {

    rg --files | rg $search

    foreach ($line in $found) 
    {
        "$command $line"
    }
}

function rgfeach($search) {
    
}