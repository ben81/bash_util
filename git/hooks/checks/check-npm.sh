#!/usr/bin/env bash
#The MIT License (MIT)
#
#Copyright (c) 2026 check-npm.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$HOOKS_DIR/lib/common.sh"

PREVIOUS_COMMIT="${1:-}"
NEW_COMMIT="${2:-}"


	

function checkVersion(){
	local previous_commit="$1"
	local new_commit="$2"
	local file="$3"
	
	local previous_version=$(git show "${previous_commit}:${file}" | jq -r '.version')
    local next_version=$(git show "${new_commit}:${file}" | jq -r '.version')	
 
 	if [[ "$previous_version" != "$next_version" ]]; then
		 		warning "\t\t⚠️ La version du fichier ${file} a été modifiée de ${previous_version} à ${next_version}."
	fi
} 
	
	



for f in $(files_add ${PREVIOUS_COMMIT} ${NEW_COMMIT} "package.json")
do
	  messageAdd
done
for f in $(files_add ${PREVIOUS_COMMIT} ${NEW_COMMIT} "package-lock.json")
do
	 messageAdd
done
for f in $(files_remove ${PREVIOUS_COMMIT} ${NEW_COMMIT} "package.json")
do
	  messageRemove
done
for f in $(files_remove ${PREVIOUS_COMMIT} ${NEW_COMMIT} "package-lock.json")
do
	 messageRemove
done



for f in $(files_changed ${PREVIOUS_COMMIT} ${NEW_COMMIT} "package.json")
do
	 messageChange
	 checkVersion "${PREVIOUS_COMMIT}" "${NEW_COMMIT}" "$f"
done
for f in $(files_changed ${PREVIOUS_COMMIT} ${NEW_COMMIT} "package-lock.json")
do
	 messageChange
	 checkVersion "${PREVIOUS_COMMIT}" "${NEW_COMMIT}" "$f"
done


