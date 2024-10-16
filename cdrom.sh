
function findCdrom(){
mount | grep "^/" | awk -F " " '{ print "stat  "$1" \"--format=%G "$3"\"" }' | sh | grep "^cdrom" | awk -F " " '{ print $2}'
}

