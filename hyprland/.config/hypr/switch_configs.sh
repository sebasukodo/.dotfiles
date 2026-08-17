#!/usr/bin/env bash
# Umschalten von Monitor- und Workspace-Config-Symlinks im Hyprland Ordner
# Aufruf erfolgt durch ./switch_configs.sh myDualSetup

set -euo pipefail

BASE_DIR="$HOME/.config/hypr"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <config-name>"
    echo
    echo "Available configs (monitors & workspaces):"
    echo "  Monitors:   $(ls "$BASE_DIR/monitors"/*.lua 2>/dev/null | xargs -n1 basename | sed 's/\.lua//')"
    echo "  Workspaces: $(ls "$BASE_DIR/workspaces"/*.lua 2>/dev/null | xargs -n1 basename | sed 's/\.lua//')"
    exit 1
fi

TARGET="$1"

# Funktion zum Symlink setzen
switch_link () {
    local DIR="$1"
    local FILE="$2"
    local TARGET="$3"

    if [ ! -f "$DIR/$TARGET.lua" ]; then
        echo "Error: '$TARGET.lua' not found in $DIR"
        return 1
    fi

    ln -sf "$TARGET.lua" "$DIR/$FILE"
    echo "Switched $FILE -> $TARGET.lua"
}

# Monitors
switch_link "$BASE_DIR/monitors" "monitor.lua" "$TARGET"

# Workspaces
switch_link "$BASE_DIR/workspaces" "workspaces.lua" "$TARGET"
