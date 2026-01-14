

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
