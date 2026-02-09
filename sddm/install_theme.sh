#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"  # get script directory
THEME_DIR="$SCRIPT_DIR/silent-theme-changes"  # local theme changes
TIMESTAMP=$(date +%Y%m%d_%H%M%S)  # timestamp for backups

# check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "Error: yay not installed. Please install yay first."
    exit 1
fi

# install sddm-silent-theme if not already installed
if ! pacman -Qs sddm-silent-theme > /dev/null; then
    echo "Installing sddm-silent-theme..."
    if ! yay -S sddm-silent-theme; then
        echo "Error: Could not install sddm-silent-theme."
        exit 1
    fi
fi

# define old and new file paths
OLD_CONFIG="/usr/share/sddm/themes/silent/configs/default.conf"
OLD_CONFIG_QML="/usr/share/sddm/themes/silent/components/Config.qml"
OLD_LOGIN_QML="/usr/share/sddm/themes/silent/components/LoginScreen.qml"
OLD_SPINNER_QML="/usr/share/sddm/themes/silent/components/Spinner.qml"
OLD_LOCKSCREEN_QML="/usr/share/sddm/themes/silent/components/LockScreen.qml"

NEW_CONFIG="$THEME_DIR/configs/default.conf"
NEW_CONFIG_QML="$THEME_DIR/components/Config.qml"
NEW_LOGIN_QML="$THEME_DIR/components/LoginScreen.qml"
NEW_SPINNER_QML="$THEME_DIR/components/Spinner.qml"
NEW_LOCKSCREEN_QML="$THEME_DIR/components/LockScreen.qml"

# backup old theme files if they exist
echo "Backing up old theme files..."
[[ -f "$OLD_CONFIG" ]] && sudo cp "$OLD_CONFIG" "${OLD_CONFIG}.${TIMESTAMP}.bak" && echo "Backup created: ${OLD_CONFIG}.${TIMESTAMP}.bak"
[[ -f "$OLD_CONFIG_QML" ]] && sudo cp "$OLD_CONFIG_QML" "${OLD_CONFIG_QML}.${TIMESTAMP}.bak" && echo "Backup created: ${OLD_CONFIG_QML}.${TIMESTAMP}.bak"
[[ -f "$OLD_LOGIN_QML" ]] && sudo cp "$OLD_LOGIN_QML" "${OLD_LOGIN_QML}.${TIMESTAMP}.bak" && echo "Backup created: ${OLD_LOGIN_QML}.${TIMESTAMP}.bak"
[[ -f "$OLD_SPINNER_QML" ]] && sudo cp "$OLD_SPINNER_QML" "${OLD_SPINNER_QML}.${TIMESTAMP}.bak" && echo "Backup created: ${OLD_SPINNER_QML}.${TIMESTAMP}.bak"
[[ -f "$OLD_LOCKSCREEN_QML" ]] && sudo cp "$OLD_LOCKSCREEN_QML" "${OLD_LOCKSCREEN_QML}.${TIMESTAMP}.bak" && echo "Backup created: ${OLD_LOCKSCREEN_QML}.${TIMESTAMP}.bak"

# copy new theme files
echo "Copying new theme files..."
sudo cp "$NEW_CONFIG" "$OLD_CONFIG" || { echo "Error: Could not copy $NEW_CONFIG"; exit 1; }
sudo cp "$NEW_CONFIG_QML" "$OLD_CONFIG_QML" || { echo "Error: Could not copy $NEW_CONFIG_QML"; exit 1; }
sudo cp "$NEW_LOGIN_QML" "$OLD_LOGIN_QML" || { echo "Error: Could not copy $NEW_LOGIN_QML"; exit 1; }
sudo cp "$NEW_SPINNER_QML" "$OLD_SPINNER_QML" || { echo "Error: Could not copy $NEW_SPINNER_QML"; exit 1; }
sudo cp "$NEW_LOCKSCREEN_QML" "$OLD_LOCKSCREEN_QML" || { echo "Error: Could not copy $NEW_LOCKSCREEN_QML"; exit 1; }

echo "Theme files successfully updated."

# install sddm.conf
SOURCE_FILE="$SCRIPT_DIR/sddm.conf"
TARGET_FILE="/etc/sddm.conf"
if [[ -f "$SOURCE_FILE" ]]; then
    [[ -f "$TARGET_FILE" ]] && sudo cp "$TARGET_FILE" "${TARGET_FILE}.${TIMESTAMP}.bak" && echo "Backup created: ${TARGET_FILE}.${TIMESTAMP}.bak"
    sudo cp "$SOURCE_FILE" "$TARGET_FILE" && echo "sddm.conf successfully copied to /etc/sddm.conf." || { echo "Error: Could not copy sddm.conf"; exit 1; }
else
    echo "Warning: sddm.conf not found, skipping."
fi

# make helper scripts executable
for file in change_wallpaper.sh change_avatar.sh; do
    SCRIPT_FILE="$SCRIPT_DIR/$file"
    if [[ -f "$SCRIPT_FILE" ]]; then
        chmod +x "$SCRIPT_FILE" && echo "$file made executable."
    else
        echo "Warning: $file not found, skipping."
    fi
done

echo "All done!"
