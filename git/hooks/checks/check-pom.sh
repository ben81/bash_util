#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$HOOKS_DIR/lib/common.sh"

PREVIOUS_COMMIT="${1:-}"
NEW_COMMIT="${2:-}"

POM_FILE="pom.xml"



for f in $(files_changed ${PREVIOUS_COMMIT} ${NEW_COMMIT} ${POM_FILE})
do
	  message
done