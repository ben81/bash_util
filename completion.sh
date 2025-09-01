#!/bin/bash

if [[ "$0" == "$BASH_SOURCE" ]]; then
    echo "Erreur : ce script doit être sourcé, pas exécuté." >&2
    exit 1
fi


echo init npm completion
source <(npm completion)

echo init pandoc completion
source <(pandoc --bash-completion)

