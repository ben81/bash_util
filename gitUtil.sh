#The MIT License (MIT)
#
#Copyright (c) 2025-2026 gitUtil.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.




if [[ "$0" == "$BASH_SOURCE" ]]; then
    echo "Erreur : ce script doit être sourcé, pas exécuté." >&2
    exit 1
fi

function insideGit() {
    git rev-parse 2> /dev/null
}

function insideGitWorkTree() {
    git rev-parse --is-inside-work-tree | grep true > /dev/null
}

function insideGitDir() {
    git rev-parse  --is-inside-git-dir | grep true > /dev/null
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
        #    else
        #        echo 'Not a git repo'
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

function repoWorkTree() {
    repoGit | sed 's@/.git$@@'
}


function lsIgnore() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        find $PWD -maxdepth 1 -exec git check-ignore {} -v ';' |  column -t    -o ' | '
    else
        echo 'Not a git repo'
    fi
}

function findIgnore() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        find  -exec git check-ignore {} -v ';'|  column -t    -o ' '
    else
        echo 'Not a git repo'
    fi
}

#
# use a return code for detect
#
function hasNeedCommit() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        git status --porcelain | grep '.' >/dev/null
    else
        echo "A" | grep B >/dev/null
    fi
}


function needCommit() {
    hasNeedCommit
    if [[ $? -eq 0 ]]
    then
        echo "*"
    fi
}

function ignoredFolder() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        git check-ignore . >/dev/null
        if [[ $? -eq 0 ]]
        then
            echo " [Ignored folder]"
        fi
    fi
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
        for pom in $(git --git-dir=$d ls-files -- '**/pom.xml' 'pom.xml')
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
        # create alias from package.json project
        for json in $(git --git-dir=$d ls-files -- '**/package.json' 'package.json')
        do
            # echo ${folder}/${json}
            jsonfolder=$(dirname  ${folder}/${json})
            jsonName=$( jq -r .name ${folder}/${json})
            alias cd${jsonName}="cd $jsonfolder"
            alias cd${jsonName}
        done
        # echo eclipse .project
        for prj in $(git --git-dir=$d ls-files -- '**/.project' '.project')
        do
            # echo ${folder}/${prj}
            prjfolder=$(dirname  ${folder}/${prj})
            prjName=$( echo "cat /projectDescription/name/text()" | xmllint --shell ${folder}/${prj} | sed '/^\/ >/d')
            #echo "project $prjName"
            alias cd${prjName}="cd $prjfolder"
            alias cd${prjName}
        done
    done
    echo "return to $OLD"
    cd "$OLD"
}

function commitIstagged() {
    git describe --tags --exact-match $(git rev-parse HEAD)  >/dev/null 2>&1
}

function currentTag() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        commitIstagged
        if [[ $? -eq 0 ]]
        then
            git tag --contains HEAD --column
        fi
    fi

}

function tracking_info() {
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git for-each-ref --format='%(upstream:track)' refs/heads/"$current_branch"
}




function currentBranchGit() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        echo "[$(git branch --show-current)]"
    fi
}


function gitPrompt() {
    insideGit
    if [[ $? -eq 0 ]]
    then
        printf "[$(git branch --show-current)] "
        insideGitWorkTree
        if [[ $? -eq 0 ]]
        then
            if git rev-parse --verify HEAD >/dev/null 2>&1; then
                commitIstagged
                if [[ $? -eq 0 ]]
                then
                    printf "<$(git tag --contains HEAD --column)> "
                fi

                printf "$(tracking_info)$(needCommit)$(ignoredFolder)\n"
            else
                printf "$(needCommit)$(ignoredFolder)\n"
            fi
        else
            insideGitDir
            if [[ $? -eq 0 ]]
            then
                printf "<gitdir>\n"
            fi
        fi
    fi


}
