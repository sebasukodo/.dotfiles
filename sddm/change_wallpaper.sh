#!/bin/bash

TARGET="/usr/share/sddm/themes/silent/backgrounds/smoky.jpg"

# check argument
if [[ -z "$1" ]]; then
    echo "Use: $0 <path_to_wallpaper>"
    exit 1
fi

SOURCE="$1"

# check source for existence
if [[ ! -f "$SOURCE" ]]; then
    echo "Error: File '$SOURCE' does not exist."
    exit 1
fi

# create backup with timestamp
if [[ -f "$TARGET" ]]; then
    BACKUP="${TARGET}.$(date +%Y%m%d_%H%M%S).bak"
    sudo cp "$TARGET" "$BACKUP"
    echo "Backup created: $BACKUP"
fi

# copy wallpaper
sudo cp "$SOURCE" "$TARGET"

if [[ $? -eq 0 ]]; then
    echo "Successfully set new wallpaper."
else
    echo "Could not set new wallpaper"
    exit 1
fi
