#!/bin/bash
echo "== Backup start"

DIR=~/ya/dotfiles

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

# yandex
echo ":: copy yandex-disk config"
mkdir -p "$CFG/yandex-disk"
cp ~/.config/yandex-disk/config.cfg             "$CFG/yandex-disk/config.cfg"

# cfg
CFG="$DIR/config"
echo ":: rsync dotfiles"
rsync -a ~/.config/alacritty                    "$CFG"
rsync -a ~/.config/hypr                         "$CFG" 
rsync -a ~/.config/nvim                         "$CFG" --exclude .git
rsync -a ~/.config/vifm                         "$CFG" 
rsync -a ~/.config/waybar                       "$CFG" 

# git commit & push
echo ":: git add"
cd $DIR && git add .
echo ":: git commit"
cd $DIR && git commit -m "$1"
echo ":: git push"
cd $DIR && git push

echo "== Backup complete!"
exit 0

