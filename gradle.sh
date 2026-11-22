
#!/usr/bin/env bash

# The MIT License (MIT)
#
# Copyright (c) 2026
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

# Directories searched for Gradle installations
GRADLE_SEARCH_PATHS=(
    /opt/gradle
    /usr/local/gradle
)

# --------------------------------------------------
# Bash completion
# --------------------------------------------------

function __setGradleHome() {

    local WORDS=()
    local index=1
    local root candidate

    # Search Gradle installations
    for root in "${GRADLE_SEARCH_PATHS[@]}"; do

        [[ -d "$root" ]] || continue

        for candidate in "$root"/*; do

            [[ -x "$candidate/bin/gradle" ]] || continue

            local gradle_dir="$candidate"
            local gradle_name
            gradle_name=$(basename "$gradle_dir")

            WORDS+=("$index|$gradle_dir|$gradle_name")

            ((index++))
        done
    done

    local FOR_DISPLAY=1

    if [[ "${__setGradleHome_PREV_LINE:-}" != "$COMP_LINE" ]] ||
       [[ "${__setGradleHome_PREV_POINT:-}" != "$COMP_POINT" ]]; then

        __setGradleHome_PREV_LINE=$COMP_LINE
        __setGradleHome_PREV_POINT=$COMP_POINT
        FOR_DISPLAY=
    fi

    local IFS=$'\n'

    COMPREPLY=($(
        for WORD in "${WORDS[@]}"; do

            IFS='|' read -ra SP <<< "$WORD"

            if [[ "${SP[1]:0:${#2}}" == "$2" ]]; then

                if [[ -n "$FOR_DISPLAY" ]]; then
                    printf "%-*s\n" "$COLUMNS" \
                        "${SP[0]}: ${SP[1]} | ${SP[2]}"
                else
                    printf '%s\n' "${SP[1]}"
                fi

            fi
        done
    ))
}

# --------------------------------------------------
# Set Gradle home
# --------------------------------------------------

function setGradleHome() {

    if [[ -z "${1:-}" ]]; then
        echo "setGradleHome <folder>"
        return 1
    fi

    local gradle_dir="$1"

    if [[ -x "$gradle_dir/bin/gradle" ]]; then

        local OLD_GRADLE_HOME="${GRADLE_HOME:-}"

        # Remove previous Gradle from PATH
        if [[ -n "$OLD_GRADLE_HOME" ]]; then
            removePath "${OLD_GRADLE_HOME}/bin/" > /dev/null
        fi

        # Update GRADLE_HOME
        export GRADLE_HOME="$gradle_dir"

        # Add new Gradle to PATH
        addPath "$GRADLE_HOME/bin/"

        echo "update GRADLE_HOME: ${GRADLE_HOME}"
        echo "update PATH add in first: ${GRADLE_HOME}/bin"

        "$GRADLE_HOME/bin/gradle" --version

    else

        echo "setGradleHome <Gradle home folder>"
        echo "Invalid Gradle installation: $gradle_dir"
        return 1

    fi
}

# --------------------------------------------------
# Unset Gradle home
# --------------------------------------------------

function unsetGradleHome() {

    local OLD_GRADLE_HOME="${GRADLE_HOME:-}"

    unset GRADLE_HOME

    if [[ -n "$OLD_GRADLE_HOME" ]]; then
        removePath "${OLD_GRADLE_HOME}/bin/" > /dev/null
        echo "GRADLE_HOME unset"
        echo "Removed from PATH: ${OLD_GRADLE_HOME}/bin"
    fi
}

# --------------------------------------------------
# Display current Gradle home
# --------------------------------------------------

function gradleHome() {

    if [[ -z "${GRADLE_HOME:-}" ]]; then
        echo "GRADLE_HOME is not defined"
        return 1
    fi

    echo "GRADLE_HOME: ${GRADLE_HOME}"

    if [[ -x "$GRADLE_HOME/bin/gradle" ]]; then
        "$GRADLE_HOME/bin/gradle" --version
    else
        echo "Invalid Gradle installation"
        return 1
    fi
}

# --------------------------------------------------
# Completion registration
# --------------------------------------------------

complete -F __setGradleHome setGradleHome
