#!/bin/bash

if [[ "$0" == "$BASH_SOURCE" ]]; then
    echo "Erreur : ce script doit être sourcé, pas exécuté." >&2
    exit 1
fi


which npm > /dev/null
if [[ $? -eq 0 ]]
then
    echo init npm completion
    source <(npm completion)
fi

which pandoc > /dev/null
if [[ $? -eq 0 ]]
then
    echo init pandoc completion
    source <(pandoc --bash-completion)
fi
