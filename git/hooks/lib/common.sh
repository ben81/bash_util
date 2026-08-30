#!/bin/bash
#The MIT License (MIT)
#
#Copyright (c) 2026 common.sh
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#!/usr/bin/env bash

set -euo pipefail

# ============================================================
# Colors
# ============================================================

readonly RED='\033[31m'
readonly GREEN='\033[32m'
readonly YELLOW='\033[33m'
readonly BLUE='\033[34m'
readonly CYAN='\033[36m'
readonly RESET='\033[0m'


# ============================================================
# Output
# ============================================================

info() {
    echo -e "${BLUE}ℹ${RESET} $*"
}

success() {
    echo -e "${GREEN}✔${RESET} $*"
}

warning() {
    echo -e "${YELLOW}⚠${RESET} $*"
}

error() {
    echo -e "${RED}✖${RESET} $*"
}

section() {
    echo
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "$*"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
}


# ============================================================
# Git
# ============================================================

files_changed() {
    local previous_commit="$1"
    local new_commit="$2"
    local file="$3"
    git diff --name-only "${previous_commit}" "${new_commit}" | grep  "${file}"; 
}

message(){
	echo -e "${RED}⚠️ Le fichier ${RESET}${f}${RED} a été modifié entre $PREVIOUS_COMMIT et $NEW_COMMIT. ${RESET}"
}
