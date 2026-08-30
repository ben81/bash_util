#!/usr/bin/env bash

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


