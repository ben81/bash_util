#The MIT License (MIT)
#
#Copyright (c) 2025-2026 gitChangedSince.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



function list() {
    for git in $(find $PWD -name ".git" )
    do
        cd ${git}/..
        NAME=$(basename $PWD)
        gitUserMail=$(git config user.email)
        branch=$(git --git-dir="$git" branch --show-current)
        if git rev-parse --verify HEAD >/dev/null 2>&1; then

            sha1plus=$(git log --pretty="%H %ae" | grep ${gitUserMail} -m 1)
            if [[ $? -eq 0 ]]
            then
                sha1=$(echo "$sha1plus" | awk -F " " '{print $1}')
                name=$(echo "$sha1plus" | awk -F " " '{print $2}')
                (git log ${sha1}..HEAD --pretty="%H" | grep ".") >> /dev/null
                if [[ $? -eq 0 ]]
                then
                    count=$(git log ${sha1}..HEAD --pretty="%H" | wc -l)
                else
                    count="<No Change>"
                fi
            else
                change="No User Commit"
            fi
            #  echo "$NAME [$branch] $change $count $name"
            printf  "%-40s | %-25s | %15s  |  %-30s  | %-60s\n" $NAME $branch "$change $count" "$name"  "$PWD"
        else
            printf  "%-40s | %-25s | --  |  --  | %-60s\n" $NAME $branch   "$PWD"
        fi
    done

}

list | sort  | column -t  -s '|' -o '|'
