#!/bin/bash
echo "== Backup start"

DIR=~/ya/dotfiles/config

# home
echo ":: copy home cfg"
mkdir -p "$DIR/bash"
cp ~/.bashrc                                    "$DIR/bash/.bashrc"
mkdir -p "$DIR/xinit"
cp ~/.xinitrc                                   "$DIR/xinit/.xinitrc"
mkdir -p "$DIR/zsh"
cp ~/.zshrc                                     "$DIR/zsh/.zshrc"
cp ~/.zprofile                                  "$DIR/zsh/.zprofile"
cp ~/.oh-my-zsh/custom/themes/jovial.zsh-theme  "$DIR/zsh/jovial.zsh-theme"

# sys
echo ":: copy system cfg"
mkdir -p "$DIR/grub"
cp /boot/grub/grub.cfg                          "$DIR/grub/grub.cfg"

# cfg
echo ":: rsync dotfiles"
rsync -a ~/.config/Mousepad                     "$DIR" 
rsync -a ~/.config/SpeedCrunch                  "$DIR" 
rsync -a ~/.config/Thunar                       "$DIR" 
rsync -a ~/.config/autostart                    "$DIR" 
rsync -a ~/.config/btop                         "$DIR" 
rsync -a ~/.config/alacritty                    "$DIR"
rsync -a ~/.config/hypr                         "$DIR" 
rsync -a ~/.config/mako                         "$DIR" 
rsync -a ~/.config/nvim                         "$DIR" --exclude .git
rsync -a ~/.config/vifm                         "$DIR" 
rsync -a ~/.config/waybar                       "$DIR" 

# rsync -a ~/.config/i3                           "$DIR" 
# rsync -a ~/.config/polybar                      "$DIR" 
# rsync -a ~/.config/rofi                         "$DIR" 
# rsync -a ~/.config/picom                        "$DIR" 

# yandex
echo ":: copy yandex-disk config"
mkdir -p "$CFG/yandex-disk"
cp ~/.config/yandex-disk/config.cfg             "$CFG/yandex-disk/config.cfg"

# git commit & push
echo ":: git add"
cd $DIR && git add .
echo ":: git commit -a"
cd $DIR && git commit -m "$1"
echo ":: git push"
cd $DIR && git push

echo "== Backup complete!"
exit 0


