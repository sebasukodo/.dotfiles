# Dotfiles

This repository contains my personal **dotfiles** for quickly setting up and managing my development environment on **Arch Linux**.  
Using [GNU Stow](https://www.gnu.org/software/stow/), configuration files can easily be versioned, synchronized, and deployed on new systems.  

## Included configurations
- **Hyprland** – dynamic tiling Wayland compositor  
- **Waybar** – customizable status bar for Wayland  
- **Kitty** – GPU-accelerated terminal  
- **wlogout** – graphical logout menu for Wayland

## Hyprland Setups & Switching

This setup uses modular **monitor** and **workspace** configurations.  
Inside `~/.dotfiles/hyprland/.config/hypr/` there are two folders:

- `monitors/`
- `workspaces/`

Each folder contains:
- `default.conf` → generic fallback configuration
- `myTrioSetup.conf` → 3-monitor setup
- `myDualSetup.conf` → 2-monitor setup
- a symlink (`monitor.conf` or `workspaces.conf`) pointing to one of the above files

### Switching between setups

To switch both configs at once, use the script:

```bash
~/.dotfiles/hyprland/.config/hypr/switch-configs.sh <config-name>
```

Available options are:
- default
- myTrioSetup
- myDualSetup

Example: ~/.dotfiles/hyprland/.config/hypr/switch-configs.sh myTrioSetup

This updates both monitors/monitor.conf and workspaces/workspaces.conf to point to myTrioSetup.conf.

### Reloading Waybar after switching configs

After switching monitor or workspace configurations, Waybar should be reloaded to properly reflect the new setup.

You can either use the provided reload script:

```bash
~/.dotfiles/waybar/.config/waybar/reload.sh
```

or restart Waybar manually:

```bash
killall waybar && waybar
```

### Wallpapers,  Hyprpaper & Hyprlock

Wallpapers are managed via **hyprpaper**.
You can either directly edit the configuration file:

```
.dotfiles/hyprland/.config/hypr/hyprpaper.conf
```

or place your wallpapers in the following directory:

```
~/Bilder/wallpaper/
```

Supported images should be in `.jpg` format and named according to the output they belong to, for example:

* `fallback.jpg`
* `DP-1.jpg`
* `DP-2.jpg`
* `HDMI-A-1.jpg`

This allows hyprpaper to automatically assign wallpapers based on the active monitor configuration.

The image `fallback.jpg` is used as the default wallpaper for any monitor whose name does not match `DP-1`, `DP-2`, or `HDMI-A-1`.
Hyprlock also uses `fallback.jpg` as its default background image.

## Useful Keybinds

| Shortcut                                           | Action                                                                                                     |
| -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| <kbd>Super</kbd> + <kbd>Space</kbd>                | Open rofi dmenu
| <kbd>Super</kbd> + <kbd>C</kbd>                    | Close the currently focused window (`killactive`)                                                          |
| <kbd>Super</kbd> + <kbd>Q</kbd>                    | Launch Kitty terminal                                                                                      |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>B</kbd> | Reload Waybar (`~/.dotfiles/waybar/.config/waybar/reload.sh`)                                                               |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd> | Select a region screenshot with `hyprshot`, copy to clipboard, and save it under `~/Bilder/Screenshots/`   |

## How to install all needed programs properly

See [Installation instructions](./installation.md) for details.


