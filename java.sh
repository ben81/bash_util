#/bin/bash
#The MIT License (MIT)
#
#Copyright (c) 2025 java.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


function __setJavaHome() {
    local WORDS
    local index=1
    WORDS=()
    for release in $( find  /usr/lib/jvm -name  "release")
    do
        local jvm_dir=$(dirname $release)
        local jvm_name=$(basename "$jvm_dir")
        local description=$(echo $(grep "JAVA_RUNTIME_VERSION=" $release | awk -F "=" '{ print $2}' )" - " $(grep "IMPLEMENTOR=" $release | awk -F "=" '{ print $2}' ) )
        WORDS+=("$index|$jvm_dir|$description")
        ((index++))
    done


    local FOR_DISPLAY=1
    if [ "${__setJavaHome_PREV_LINE:-}" != "$COMP_LINE" ] ||
    [ "${__setJavaHome_PREV_POINT:-}" != "$COMP_POINT" ]; then
        __setJavaHome_PREV_LINE=$COMP_LINE
        __setJavaHome_PREV_POINT=$COMP_POINT
        FOR_DISPLAY=
    fi

    local IFS=$'\n'
    COMPREPLY=($(
            for WORD in "${WORDS[@]}"; do
                IFS=\| read -ra SP <<<"$WORD"
                if [ "${SP[1]:0:${#2}}" == "$2" ]; then
                    if [ -n "$FOR_DISPLAY" ]; then
                        printf "%-*s\n" "$COLUMNS" "${SP[0]}: ${SP[1]} - ${SP[2]}"
                    else
                        echo "${SP[1]}"
                    fi
                fi
            done
    ))
}

function setJavaHome() {
    if  [[ -z "$1" ]]
    then
        echo "setJavaHome <folder>"
    else
        echo $1
        if  [[ -x "$1/bin/java" ]]
        then
            OLD_JAVA_HOME=$JAVA_HOME
            JAVA_HOME=$1
            removePath "${OLD_JAVA_HOME}/bin/" > /dev/null
            addPath "$1/bin/"
            echo "update JAVA_HOME: ${JAVA_HOME}"
            echo "update PATH add in first : ${JAVA_HOME}/bin"
        else
            echo "setJavaHome <java home folder>"
        fi

    fi
}

function unsetJavaHome() {
    OLD_JAVA_HOME=$JAVA_HOME
    unset JAVA_HOME
    removePath "${OLD_JAVA_HOME}/bin/" > /dev/null
}

function javaHome() {
    echo "java_home ${JAVA_HOME}"
}


complete -F __setJavaHome setJavaHome