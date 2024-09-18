
function insideGit(){
    git rev-parse 2> /dev/null
}


function gitRoot(){
    if [[ insideGit ]]
    then
        git rev-parse --show-toplevel
    else
        echo 'Not a git repo'
    fi
}

function cdGitRoot(){
    if [[ insideGit ]]
    then
        cd $( git rev-parse --show-toplevel)
    else
        echo 'Not a git repo'
    fi

}


