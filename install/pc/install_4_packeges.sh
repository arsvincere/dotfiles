#!/bin/bash

# Установим Х и свободные драйвера
# pacman -S xorg-server xorg-drivers xorg-xinit

# Установка Git
sudo pacman -S git
git config --global user.name "Alex Avin"
git config --global user.email "mr.alexavin@gmail.com"


# Установка AUR
pacman -Syu
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -sir --needed --noconfirm --skippgpcheck
rm -rf yay

# Install my packages
yay -S --needed --noconfirm - < packages.txt

# Install nvim plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install zsh, oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

# Install zsh theme - jovial
curl -sSL https://github.com/zthxxx/jovial/raw/master/installer.sh | sudo -E bash -s ${USER:=`whoami`}

# Install snap
# yay -S snapd
# systemctl enable snapd.socket
