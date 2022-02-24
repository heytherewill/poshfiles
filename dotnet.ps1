function dnpurge() {
    rm -rf bin
    rm -rf obj
}

function dnb() {
    dotnet build
}

function dnrb() {
    dnpurge
    dnb
}