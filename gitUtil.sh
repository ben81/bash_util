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



