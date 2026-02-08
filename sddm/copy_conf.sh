#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_FILE="$SCRIPT_DIR/sddm.conf"
TARGET_FILE="/etc/sddm.conf"

# check source for existence
if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Error: $SOURCE_FILE not found."
    exit 1
fi

# create backup with timestamp
if [[ -f "$TARGET" ]]; then
    BACKUP="${TARGET}.$(date +%Y%m%d_%H%M%S).bak"
    sudo cp "$TARGET" "$BACKUP"
    echo "Backup created: $BACKUP"
fi

# copy conf
sudo cp "$SOURCE_FILE" "$TARGET_FILE"

if [[ $? -eq 0 ]]; then
    echo "sddm.conf successfully copied to /etc/sddm.conf."
else
    echo "Could not copy conf"
    exit 1
fi
