#!/bin/bash
echo "== Restore start"

echo ":: restore grub.cfg"
sudo cp config/grub/grub.cfg        /boot/grub/grub.cfg

# echo ":: restore .xinitrc"
# cp config/xinit/.xinitrc                   ~/.xinitrc

echo ":: restore zsh"
cp config/zsh/.zshrc                ~/.zshrc
cp config/zsh/.zprofile             ~/.zprofile
cp config/zsh/jovial.zsh-theme      ~/.oh-my-zsh/custom/themes/jovial.zsh-theme

# echo ":: restore yandex-disk"
# mkdir -p ~/.config/yandex-disk
# cp "config/yandex-disk/config.cfg"  ~/.config/yandex-disk/config.cfg

echo ":: restor latex"
cp config/latex/.latexmkrc                 ~/.latexmkrc

echo ":: restore .config dir"
rsync -a config/Mousepad            ~/.config
rsync -a config/Pinta               ~/.config
rsync -a config/SpeedCrunch         ~/.config
rsync -a config/Thunar              ~/.config
rsync -a config/alacritty           ~/.config
rsync -a config/autostart           ~/.config
rsync -a config/btop                ~/.config
# rsync -a config/helix               ~/.config
rsync -a config/hypr                ~/.config
# rsync -a config/i3                  ~/.config
rsync -a config/mako                ~/.config
rsync -a config/nvim                ~/.config
# rsync -a config/picom               ~/.config
# rsync -a config/polybar             ~/.config
# rsync -a config/qtile                ~/.config
rsync -a config/qutebrowser         ~/.config
rsync -a config/ruff                ~/.config
# rsync -a config/rofi                ~/.config
# rsync -a config/vifm                ~/.config
rsync -a config/waybar              ~/.config
rsync -a config/xplr                ~/.config
rsync -a config/zellij              ~/.config

# chmod +x ~/.config/polybar/launch.sh

echo "== Restore complete!"
exit 0

