#!/usr/bin/env bash
# Umschalten von Monitor- und Workspace-Config-Symlinks im Hyprland Ordner
# Aufruf erfolgt durch ./switch_configs.sh myDualSetup

set -euo pipefail

BASE_DIR="$HOME/.config/hypr"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <config-name>"
    echo
    echo "Available configs (monitors & workspaces):"
    echo "  Monitors:   $(ls "$BASE_DIR/monitors"/*.conf 2>/dev/null | xargs -n1 basename | sed 's/\.conf//')"
    echo "  Workspaces: $(ls "$BASE_DIR/workspaces"/*.conf 2>/dev/null | xargs -n1 basename | sed 's/\.conf//')"
    exit 1
fi

TARGET="$1"

# Funktion zum Symlink setzen
switch_link () {
    local DIR="$1"
    local FILE="$2"
    local TARGET="$3"

    if [ ! -f "$DIR/$TARGET.conf" ]; then
        echo "Error: '$TARGET.conf' not found in $DIR"
        return 1
    fi

    ln -sf "$TARGET.conf" "$DIR/$FILE"
    echo "Switched $FILE -> $TARGET.conf"
}

# Monitors
switch_link "$BASE_DIR/monitors" "monitor.conf" "$TARGET"

# Workspaces
switch_link "$BASE_DIR/workspaces" "workspaces.conf" "$TARGET"
