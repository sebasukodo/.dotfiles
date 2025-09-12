# Installation Instructions

all commands to use for installing everything I need for my PC to work properly.

## Necessary folders
cd ~
mkdir Downloads/ Bilder/
cd Bilder
mkdir Screenshots/ wallpaper/

## Dependencies:
```bash
sudo pacman -Syu
sudo pacman -S git base-devel
```

### Yay
```bash
cd ~/Downloads
mkdir git
cd git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### Japanese Input
```bash
sudo pacman -S fcitx5 fcitx5-mocz fcitx5-configtool fcitx5-gtk fcitx5-qt noto-fonts-cjk
```

### Bluetooth
```bash
sudo pacman -S bluez bluez-utils linux-headers
yay -S xpadneo-dkms-git
```

### hp printer
```bash
sudo pacman -S cups ghostscript
sudo pacman -S hplip
systemctl enable --now cups.service
#change ip_addr to ip adress of printer
#hp_setup -i 192.168.x.x
```

### LaTex + Kile as editor
```bash
sudo pacman -S texlive texlive-langgerman biber kile
```

### Manga-OCR
```bash
sudo pacman -S python-pipx wl-clipboard
pipx install manga-ocr
pipx ensurepath
```

### needed programs for Hyprland and Waybar
```bash
sudo pacman -S kitty rofi waybar ttf-noto-nerd pavucontrol hyprpaper hyprshot hyprpicker hyprlock hyprpolkitagent
yay -S wlogout
yay -S rofi-bluetooth-git
```

### Gnu Stow Dotfiles
```bash
sudo pacman -S stow
cd ~
git clone git@github.com:sebasukodo/.dotfiles.git
cd .dotfiles
#rm ~/.config/hypr/hyprland.conf
stow hyprland
stow waybar
stow kitty
stow wlogout
```

### Screensharing fix
```bash
sudo pacman -S wireplumber pulseaudio xdg-desktop-portal xdg-desktop-portal-hyprland
yay -S xwaylandvideobridge-git
```

## Dual Boot with Windows
### set date and time if dual boot with windows
```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```
