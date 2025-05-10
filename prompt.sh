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



SEGMENT_RIGHT_SEPARATOR=$'\uE0B0'
SEGMENT_LEFT_SEPARATOR=$'\uE0B2'


function listcolor(){
	for i in {0..255}; do printf "\e[48;5;${i}m %3d \e[0m" $i; [[ $(( ($i+1) % 10 )) -eq 0 ]] && echo; done

}

function make_prompt() {
  local VIOLET="\[\e[38;5;171m\]"
  local CYAN="\[\e[36m\]"
  local GREEN="\[\e[38;5;83m\]"
  local RESET="\[\e[0m\]"
  local left=$'\uE0B2' 
  local right=$'\uE0B0'

  var="${VIOLET}\u@\h "
  var="$var${GREEN}\W "
  if insideGit
  then
  	 var="$var \[\e[30;101m\]${right} $(currentBranchGit)$(tracking_info)$(needCommit) \[\e[0;91m\]${right}"    
  fi
  if [[ -f pom.xml ||  -f package.json ]]
  then
    var="$var\[\e[30;106m\]${right} $(mvnArtefactVersion)$(npmNameVersion) \[\e[96;40m\]${right}" 
  fi
  var="$var${RESET} \\$"
  
  echo "$var "
}

PROMPT_COMMAND='PS1=$(make_prompt)'

PS1="$(make_prompt)"



