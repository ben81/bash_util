#!/bin/bash
#The MIT License (MIT)
#
#Copyright (c) 2024 npmUtil.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


if [[ "$0" == "$BASH_SOURCE" ]]; then
    echo "Erreur : ce script doit être sourcé, pas exécuté." >&2
    exit 1
fi

function isNpm() {
    test -f package.json
}


function specificNpmNameVersion(){	
	 if [[ "node_modules" = "$(basename $(dirname "$1"))" ]]
	 then
	 	if [[ -f "$(dirname $(dirname '$1'))/package.json" ]]
	 	then 	 
	 		specificNpmNameVersion $(dirname $(dirname $1))
       fi
       else
        if [[ "node_modules" = "$(basename $(dirname $(dirname "$1")))" ]]
	 then
	 	if [[ -f "$(dirname $(dirname $(dirname '$1')))/package.json" ]]
	 	then 	 
	 		specificNpmNameVersion $(dirname $(dirname $(dirname $1)))
       fi
       fi
	 fi
	 jq -r '"\(.name)@\(.version)"' $1/package.json
}





function npmNameVersion() {
    isNpm
    if [[ $? -eq 0 ]]
    then    
       specificNpmNameVersion $PWD |  paste -sd'#' - | sed 's/#/ # /g'
    fi
}



# Exemple d'utilisation :
# format_json "mon_fichier.json"
# Fonction pour formatter un fichier JSON si valide
function format_json() {
    local file="$1"

    # Vérifie que le fichier existe
    if [[ ! -f "$file" ]]; then
        echo "Erreur : le fichier '$file' n'existe pas." >&2
        return 1
    fi

    # Teste si le fichier est un JSON valide
    if jq empty "$file" &> /dev/null; then
        # Si valide, formate le fichier avec jq et sponge
        jq . "$file" | sponge "$file"
        echo "Le fichier '$file' a été formaté avec succès."
    else
        echo "Le fichier '$file' n'est pas un JSON valide. Aucune modification apportée."
        return 1
    fi
}

function _format_json_completion() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=""

    # Si on complète le premier argument, propose les fichiers .json
    if [[ ${COMP_CWORD} -eq 1 ]]; then
        COMPREPLY=($(compgen -f -- "${cur}" | grep -i '\.json$'))
    fi
}

# Enregistre la fonction de complétion pour la commande `format_json_if_valid`
complete -F _format_json_completion format_json




