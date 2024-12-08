#!/bin/bash
#The MIT License (MIT)
#
#Copyright (c) 2024 pathUtil.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



#
# this function list a folder in PATH variable
#
function path() {
    echo $PATH | tr ':' '\n' | grep -v "^$"
}

#
# this function add an given folder in PATH variable
#
function addPath() {
    if  [[ -z "$1" ]]
    then
        echo "addPath <folder>"
    else
    	FOLDER=$(readlink -m  "$1")
        if [[ ! -d "${FOLDER}" ]]
        then
            echo "addPath <folder> "
            echo "folder not exist $FOLDER"
        else
            export PATH="${FOLDER}:${PATH}"
        fi
    fi
}

#
# this function remove an given folder in PATH variable
#
function removePath() {
    if  [[ -z "$1" ]]
    then
        echo "removePath <folder>"
    else
        if [[ ! -d "$1" ]]
        then
            echo "removePath <folder>"
        else
            path | grep  "^$1$" >> /dev/null
            if [[ $? -eq 0 ]]
            then
                NEW=$( path | grep -v "^$1$" | tr '\n' ':' | sed "s/:$//" )
                echo $NEW
                export PATH=$NEW
            else
                echo "folder $1 not in path "
            fi
        fi
    fi

}


#
# this function clean  PATH variable
# remove unexisting folder into PATH
# remove duplicate folder into PATH
#
function cleanPath() {
    NEWPATH=":"
    local OLD_IFS=$IFS
    IFS=$(echo -en "\n\b")
    for d in $(path)
    do
        if [[ "$1" == "-r" ]]
        then
            d=$(realpath $d)
        fi
        if [[ -d "$d" ]]
        then
            echo $NEWPATH | grep ":$d:" >> /dev/null
            if [[ $? -eq 1 ]]
            then
                NEWPATH=$(echo "${NEWPATH}${d}:")
            fi
        else
            echo "Folder Not exist $d"
        fi
    done
    IFS=${OLD_IFS}
    export PATH=$(echo ${NEWPATH} | sed "s/^://" | sed "s/:$//" )
    echo $PATH
}

complete -W "-r" cleanPath

# add completion pour addPath
complete -A directory addPath


# add completion pour removePath
function _removePathCompletion() {
    COMPREPLY=($(compgen -W "$(echo $PATH | sed 's/:/ /g')" "${COMP_WORDS[1]}"))
}

complete -F _removePathCompletion removePath

