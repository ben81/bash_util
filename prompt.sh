#!/bin/bash
#The MIT License (MIT)
#
#Copyright (c) 2024 prompt.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.




#PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null); PS1_CMD2=$(cmd1)';
#PS1='\[\e[38;5;171m\]\u\[\e[0m\] @\[\e[40m\]\h\[\e[0m\]:\[\e[38;5;83m\]\w\[\e[0m\] \[\e[30;101m\]${PS1_CMD1}\[\e[91;106m\]\[\e[30m\]${PS1_CMD2}\[\e[96;40m\]\[\e[0m\]\\$ '

function __displayVersion() {
    echo "$(mvnArtefactVersion) $(npmNameVersion)"
}



PROMPT_COMMAND='PS1_CMD1=$(currentBranchGit)$(tracking_info)$(needCommit); PS1_CMD2=$(__displayVersion)';

PS1='\[\e[38;5;171m\]\u@\h\[\e[0m\]:\[\e[38;5;83m\]\W\[\e[0m\] \[\e[30;101m\]${PS1_CMD1}\[\e[91;106m\]\[\e[30m\]${PS1_CMD2}\[\e[96;40m\]\[\e[0m\]\\$ '