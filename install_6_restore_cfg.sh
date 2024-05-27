#!/bin/bash
echo "== Restore start"

# echo ":: restore .bashrc"
# cp bash/.bashrc                     ~/.bashrc

# echo ":: restore .xinitrc"
# cp xinit/.xinitrc                   ~/.xinitrc

echo ":: restore zsh"
cp config/zsh/.zshrc                ~/.zshrc
cp config/zsh/.zprofile             ~/.zprofile
cp config/zsh/jovial.zsh-theme      ~/.oh-my-zsh/custom/themes/jovial.zsh-theme  

echo ":: restore yandex-disk"
mkdir -p ~/.config/yandex-disk
cp "config/yandex-disk/config.cfg"  ~/.config/yandex-disk/config.cfg  

echo ":: restore grub.cfg"
sudo cp config/grub/grub.cfg        /boot/grub/grub.cfg

echo ":: restore .config files"
rsync -a config/Mousepad            ~/.config
rsync -a config/SpeedCrunch         ~/.config
rsync -a config/Thunar              ~/.config
rsync -a config/autostart           ~/.config
rsync -a config/btop                ~/.config
rsync -a config/alacritty           ~/.config
rsync -a config/hypr                ~/.config
rsync -a config/mako                ~/.config
rsync -a config/nvim                ~/.config
rsync -a config/vifm                ~/.config
rsync -a config/waybar              ~/.config

rsync -a config/i3                  ~/.config
rsync -a config/polybar             ~/.config
rsync -a config/rofi                ~/.config
rsync -a config/picom               ~/.config
chmod +x ~/.config/polybar/launch.sh

# Git
git config --global user.name "arsvincere"
git config --global user.email "mr.alexavin@gmail.com"

echo "== Restore complete!"
exit 0

