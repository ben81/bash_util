#!/bin/bash
#The MIT License (MIT)
#
#Copyright (c) 2024-2026 installGradle.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.




#!/usr/bin/env bash

set -Eeuo pipefail

INSTALL_DIR="/opt/gradle"
CURRENT_API="https://services.gradle.org/versions/current"
ALL_API="https://services.gradle.org/versions/all"

# --------------------------------------------------
# Fonctions
# --------------------------------------------------

usage() {
    cat <<EOF
Usage: $0 [OPTION]

Options:
  -v VERSION   Installe une version précise de Gradle
  -l [MAJOR]   Liste les versions disponibles
               (optionnel : filtrer par version majeure)
  -h           Affiche cette aide

Exemples:
  $0
  $0 -v 8.14.3
  $0 -l
  $0 -l 8
  $0 -l 9
EOF
}

check_dependencies() {
    for cmd in curl jq unzip sudo; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            echo "ERREUR : $cmd est requis."
            exit 1
        fi
    done
}

# Versions stables uniquement
is_stable_filter='
    .snapshot == false
    and .nightly == false
    and .releaseNightly == false
    and .activeRc == false
    and .broken == false
    and ((.rcFor // "") == "")
    and ((.milestoneFor // "") == "")
'

# --------------------------------------------------
# Liste des versions
# --------------------------------------------------


list_versions() {
    local major="${1:-}"

    echo "Récupération des versions Gradle..."

    local json
    json=$(curl -fsSL "$ALL_API")

    if [[ -n "$major" && ! "$major" =~ ^[0-9]+$ ]]; then
        echo "ERREUR : version majeure invalide : $major"
        exit 1
    fi

    echo
    echo "Versions Gradle disponibles :"
    echo "--------------------------------"

    jq -r --arg major "$major" '
        [
            .[]
            | select(
                .version
                | test("^[0-9]+\\.[0-9]+(\\.[0-9]+)?$")
            )
            | select(
                .snapshot == false
                and .nightly == false
                and .broken == false
                and ((.rcFor // "") == "")
                and ((.milestoneFor // "") == "")
            )
            | select(
                $major == ""
                or (.version | startswith($major + "."))
            )
        ]
        | sort_by(
            .version
            | split(".")
            | map(tonumber)
        )
        | reverse
        | .[].version
    ' <<< "$json"

    echo "--------------------------------"
}

# --------------------------------------------------
# Installation
# --------------------------------------------------

install_gradle() {
    local version="$1"
    local download_url="$2"

    local target_dir="$INSTALL_DIR/gradle-$version"
    local tmp_dir

    tmp_dir=$(mktemp -d)

    echo
    echo "Installation de Gradle $version"
    echo "URL : $download_url"

    # Téléchargement
    echo "Téléchargement..."
    curl -fL "$download_url" -o "$tmp_dir/gradle.zip"

    # Extraction
    echo "Extraction..."
    unzip -q "$tmp_dir/gradle.zip" -d "$tmp_dir"

    # Vérification de l'archive
    if [[ ! -d "$tmp_dir/gradle-$version" ]]; then
        echo "ERREUR : archive Gradle invalide."
        exit 1
    fi

    # Installation
    echo "Installation dans $target_dir..."

    mkdir -p "$INSTALL_DIR"

    rm -rf "$target_dir"
    mv "$tmp_dir/gradle-$version" "$target_dir"

    # Mise à jour du lien symbolique
    ln -sfn "$target_dir" "$INSTALL_DIR/current"

    echo
    echo "Gradle $version installé avec succès !"
    echo

    "$target_dir/bin/gradle" --version
}

# --------------------------------------------------
# Résolution d'une version spécifique
# --------------------------------------------------


install_specific_version() {
    local requested_version="$1"

    if [[ ! "$requested_version" =~ ^[0-9]+(\.[0-9]+){1,2}$ ]]; then
        echo "ERREUR : format de version invalide : $requested_version"
        exit 1
    fi

    echo "Recherche de Gradle $requested_version..."

    local json
    json=$(curl -fsSL "$ALL_API")

    local result
    result=$(jq -c \
        --arg requested "$requested_version" '
        [
            .[]
            | select(.version == $requested)
            | select(
                .version | test("^[0-9]+\\.[0-9]+(\\.[0-9]+)?$")
            )
            | select(
                .snapshot == false
                and .nightly == false
                and .broken == false
                and ((.rcFor // "") == "")
            )
        ]
        | first // empty
    ' <<< "$json")

    if [[ -z "$result" ]]; then
        echo "ERREUR : version stable $requested_version introuvable."
        exit 1
    fi

    local download_url
    download_url=$(jq -r '.downloadUrl' <<< "$result")

    install_gradle "$requested_version" "$download_url"
}


# --------------------------------------------------
# Installation de la dernière version
# --------------------------------------------------

install_current() {
    echo "Recherche de la dernière version stable..."

    local json
    json=$(curl -fsSL "$CURRENT_API")

    local version
    version=$(jq -er '.version' <<< "$json")

    local download_url
    download_url=$(jq -er '.downloadUrl' <<< "$json")

    echo "Dernière version disponible : $version"

    install_gradle "$version" "$download_url"
}

# --------------------------------------------------
# Programme principal
# --------------------------------------------------

check_dependencies

case "${1:-}" in

    "")
        install_current
        ;;

    -v)
        if [[ $# -ne 2 ]]; then
            usage
            exit 1
        fi
        install_specific_version "$2"
        ;;

    -l)
        if [[ $# -gt 2 ]]; then
            usage
            exit 1
        fi
        list_versions "${2:-}"
        ;;

    -h|--help)
        usage
        ;;

    *)
        echo "ERREUR : option inconnue : $1"
        usage
        exit 1
        ;;

esac
