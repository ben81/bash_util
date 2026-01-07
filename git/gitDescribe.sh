
function describe(){

for i in $(find $PWD -name ".git" )
do 
  cd $i/..
  printf "%-40s | %-30s| %-55s |%-40s\n" "$(basename $PWD)"  "$(git describe --always 2>/dev/null)" "$(git log -1 '--pretty=%ae | %an ')"  "$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')"

done }

describe | column -s "|" -t -o "|"

