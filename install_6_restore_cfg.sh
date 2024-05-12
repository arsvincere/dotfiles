#!/bin/bash
echo "== Restore start"

echo ":: restore .bashrc"
cp bash/.bashrc                     ~/.bashrc

echo ":: restore .xinitrc"
cp xinit/.xinitrc                   ~/.xinitrc

echo ":: restore zsh"
cp zsh/.zshrc                       ~/.zshrc
cp zsh/.zprofile                    ~/.zprofile
cp zsh/jovial.zsh-theme             ~/.oh-my-zsh/custom/themes/jovial.zsh-theme  

echo ":: restore yandex-disk"
mkdir -p ~/.config/yandex-disk
cp "config/yandex-disk/config.cfg"  ~/.config/yandex-disk/config.cfg  

echo ":: restore grub.cfg"
sudo cp grub/grub.cfg                   /boot/grub/grub.cfg

echo ":: restore .config files"
rsync -a config/alacritty          ~/.config
rsync -a config/awesome            ~/.config
rsync -a config/i3                 ~/.config
rsync -a config/nitrogen           ~/.config
rsync -a config/nvim               ~/.config
rsync -a config/rofi               ~/.config
rsync -a config/picom              ~/.config
rsync -a config/polybar            ~/.config
rsync -a config/wifm                ~/.config
chmod +x ~/.config/polybar/launch.sh

echo "== Restore complete!"
exit 0

