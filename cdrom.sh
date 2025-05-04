#!/bin/bash


function findCdrom() {
    mount | grep "^/" | awk -F " " '{ print "stat  "$1" \"--format=%G "$3"\"" }' | sh | grep "^cdrom" | awk -F " " '{ print $2}'
}


function cdfindCdrom()
{
    CDROM=$(findCdrom)
    echo "$CDROM" | grep "." >/dev/null
    if [[ $? -eq 0 ]]
    then
        cd $CDROM
    fi
}