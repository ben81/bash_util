#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$HOOKS_DIR/lib/common.sh"


run_checks() {
    local previous_commit="$1"
    local new_commit="$2"

    local check
	echo "run checker"
    for check in "$HOOKS_DIR"/checks/*.sh; do

        [[ -f "$check" ]] || continue

        if [[ ! -x "$check" ]]; then
            warning "Check non exécutable : $check"
            continue
        fi

        "$check" \
            "$previous_commit" \
            "$new_commit"

    done
}
