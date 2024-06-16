#!/bin/bash
echo "== Backup start"

DIR=~/ya/conf/config/

echo ":: copy grub cfg"
mkdir -p "$DIR/grub"
cp /boot/grub/grub.cfg                          "$DIR/grub/grub.cfg"

echo ":: copy xinitrc"
mkdir -p "$DIR/xinit"
cp ~/.xinitrc                                   "$DIR/xinit/.xinitrc"

echo ":: copy zsh"
mkdir -p "$DIR/zsh"
cp ~/.zshrc                                     "$DIR/zsh/.zshrc"
cp ~/.zprofile                                  "$DIR/zsh/.zprofile"
cp ~/.oh-my-zsh/custom/themes/jovial.zsh-theme  "$DIR/zsh/jovial.zsh-theme"

echo ":: copy yandex-disk config"
mkdir -p "$DIR/yandex-disk"
cp ~/.config/yandex-disk/config.cfg             "$DIR/yandex-disk/config.cfg"

echo ":: copy latex"
mkdir -p "$DIR/latex"
cp ~/.latexmkrc                                 "$DIR/latex/.latexmkrc"

echo ":: rsync ~/.config"
rsync -a ~/.config/Mousepad                     "$DIR" 
rsync -a ~/.config/Pinta                        "$DIR" 
rsync -a ~/.config/SpeedCrunch                  "$DIR" 
rsync -a ~/.config/Thunar                       "$DIR" 
rsync -a ~/.config/alacritty                    "$DIR"
rsync -a ~/.config/autostart                    "$DIR" 
# rsync -a ~/.config/awesome                      "$DIR" 
rsync -a ~/.config/btop                         "$DIR" 
rsync -a ~/.config/helix                        "$DIR" 
rsync -a ~/.config/hypr                         "$DIR" 
rsync -a ~/.config/mako                         "$DIR" 
rsync -a ~/.config/nvim                         "$DIR"
rsync -a ~/.config/qtile                        "$DIR"
rsync -a ~/.config/qutebrowser                  "$DIR"
rsync -a ~/.config/vifm                         "$DIR" 
rsync -a ~/.config/waybar                       "$DIR" 
rsync -a ~/.config/xplr                         "$DIR" 
rsync -a ~/.config/zellij                       "$DIR" 

# rsync -a ~/.config/i3                           "$DIR" 
# rsync -a ~/.config/polybar                      "$DIR" 
# rsync -a ~/.config/rofi                         "$DIR" 
# rsync -a ~/.config/picom                        "$DIR" 


NVIM_PLUGS="$HOME/.local/share/nvim/plugged/"
mkdir -p "$DIR/nvim_custom/pretty-fold"
pretty_fold="$NVIM_PLUGS/pretty-fold.nvim/lua/pretty-fold/init.lua"
cp pretty_fold                                  "$DIR/nvim_custom/pretty_fold/init.lua"

# git commit & push
echo ":: git add"
cd $DIR && git add .
echo ":: git commit "
cd $DIR && git commit -a -m "$1"
echo ":: git push"
cd $DIR && git push

echo "== Backup complete!"
exit 0

