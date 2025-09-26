# Installation Instructions

all commands to use for installing everything I need for my PC to work properly.

## Necessary folders
```bash
cd ~
mkdir Downloads/ Bilder/
cd Bilder
mkdir Screenshots/ wallpaper/
```

## Dependencies
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

### Bluetooth
```bash
sudo pacman -S bluez bluez-utils linux-headers
yay -S xpadneo-dkms-git
```

### Hyprland and Waybar
```bash
#sudo pacman -S hyprland
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

## Optional dependencies

### Docker + Docker Desktop
```bash
# Install Docker Desktop from AUR
yay -S docker-desktop

# Create a new GPG key (with encryption support, required for pass)
gpg --quick-generate-key "Your Name <your-email@mail.com>" rsa3072 cert,sign,auth,encr never

# Show your secret keys and copy the Key ID (the part after "rsa3072/")
gpg --list-secret-keys --keyid-format=long

# Initialize pass with your Key ID
pass init <copied-key-id>
```

### Japanese Input
```bash
sudo pacman -S fcitx5 fcitx5-mocz fcitx5-configtool fcitx5-gtk fcitx5-qt noto-fonts-cjk
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

### neovim
```bash
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
cd ~/.dotfiles
stow nvim
```

### Manga-OCR
```bash
sudo pacman -S python-pipx wl-clipboard
pipx install manga-ocr
pipx ensurepath
```

## Dual Boot with Windows

### set date and time if dual boot with windows
```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```
