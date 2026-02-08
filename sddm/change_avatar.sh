#!/usr/bin/env bash

SYSTEM_SCRIPT="/usr/share/sddm/themes/silent/change_avatar.sh"

# checkl existence
if [[ ! -x "$SYSTEM_SCRIPT" ]]; then
    echo "Error: $SYSTEM_SCRIPT not found or not executable"
    exit 1
fi

exec "$SYSTEM_SCRIPT" "$@"
