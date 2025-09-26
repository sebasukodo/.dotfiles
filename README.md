# Dotfiles

This repository contains my personal **dotfiles** for quickly setting up and managing my development environment on **Arch Linux**.  
Using [GNU Stow](https://www.gnu.org/software/stow/), configuration files can easily be versioned, synchronized, and deployed on new systems.  

## Included configurations
- **Hyprland** – dynamic tiling Wayland compositor  
- **Waybar** – customizable status bar for Wayland  
- **Kitty** – GPU-accelerated terminal  
- **wlogout** – graphical logout menu for Wayland
- **Neovim** – extensible text editor (based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim))

## Hyprland Setups & Switching

This setup uses modular **monitor** and **workspace** configurations.  
Inside `~/.config/hypr/` there are two folders:

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
~/.config/hypr/switch-setup.sh <config-name>
```

Available options are:
- default
- myTrioSetup
- myDualSetup

Example: ~/.config/hypr/switch-setup.sh myTrioSetup

This updates both monitors/monitor.conf and workspaces/workspaces.conf to point to myTrioSetup.conf.

## Useful Keybinds

| Shortcut                                           | Action                                                                                                     |
| -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| <kbd>Super</kbd> + <kbd>Space</kbd>                | Open rofi dmenu
| <kbd>Super</kbd> + <kbd>C</kbd>                    | Close the currently focused window (`killactive`)                                                          |
| <kbd>Super</kbd> + <kbd>Q</kbd>                    | Launch Kitty terminal                                                                                      |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>B</kbd> | Reload Waybar (`~/.config/waybar/reload.sh`)                                                               |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd> | Select a region screenshot with `hyprshot`, copy to clipboard, and save it under `~/Bilder/Screenshots/`   |

## How to install all needed programs properly

See [Installation instructions](./installation.md) for details.
