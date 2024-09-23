#!/bin/bash


function insideGit() {
    git rev-parse 2> /dev/null
}


function gitRoot() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        git rev-parse --show-toplevel
    else
        echo 'Not a git repo'
    fi
}

function cdGitRoot() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        cd $( git rev-parse --show-toplevel)
    else
        echo 'Not a git repo'
    fi
}

function pwdGit() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        realpath -s --relative-to=$( git rev-parse --show-toplevel) $PWD/
    else
        echo 'Not a git repo'
    fi
}

function repoGit() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        git rev-parse --absolute-git-dir
    else
        find $PWD -name '.git'  2>/dev/null
    fi
}


function lsIgnore() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        find  -maxdepth 1 -exec git check-ignore {} ';'
    else
        echo 'Not a git repo'
    fi
}

function findIgnore() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        find  -exec git check-ignore {} ';'
    else
        echo 'Not a git repo'
    fi
}



function needCommit() {
    #insideGit
    #   if [[ $? -eq 0 ]]
    git status --porcelain | grep '.' >/dev/null
}

function initAliasCdGitRepo() {
    local OLD=$PWD
    for d  in $( repoGit )
    do
        folder=$(dirname $d)
        name=$(basename $folder)
        alias cd${name}="cd $folder"
        alias cd${name}
        # create alias from pom.xml project
        for pom in $(git --git-dir=$d ls-files -- '**/pom.xml')
        do
            #  echo ${folder}/${pom}
            pomfolder=$(dirname  ${folder}/${pom})
            artifact=$(xmllint --shell ${folder}/${pom} <<< "setns ns=http://maven.apache.org/POM/4.0.0
            cat /ns:project/ns:artifactId/text()" | grep -v "^/" )
            if  [[ $? -eq 0 ]]
            then
                alias cd${artifact}="cd $pomfolder"
                alias cd${artifact}
            fi
        done
        # create alas from package.json project
        for json in $(git --git-dir=$d ls-files -- '**/package.json')
        do
            # echo ${folder}/${json}
            jsonfolder=$(dirname  ${folder}/${json})
            jsonName=$( jq -r .name ${folder}/${json})
            alias cd${jsonName}="cd $jsonfolder"
            alias cd${jsonName}
        done
    done
    echo "return to $OLD"
    cd "$OLD"
}
