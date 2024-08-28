#!/bin/bash

# Установим Х и свободные драйвера
# pacman -S xorg-server xorg-drivers xorg-xinit

echo ":: connecting to internet"
systemctl start NetworkManager.service
systemctl enable NetworkManager.service
nmcli device wifi list
nmcli device wifi connect Keenetic-8471 password Q2Wobiko

echo ":: install 'git'"
sudo pacman -S git
git config --global user.name "Alex Avin"
git config --global user.email "mr.alexavin@gmail.com"

echo ":: install 'yay'"
pacman -Syu
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -sir --needed --noconfirm --skippgpcheck
rm -rf yay

echo ":: install all packages"
yay -S --needed --noconfirm - < install/toshiba/packages.txt

echo ":: install nvim plug"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo ":: install zsh oh-my-zsh"
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

echo ":: install zsh theme - jovial"
curl -sSL https://github.com/zthxxx/jovial/raw/master/installer.sh | sudo -E bash -s ${USER:=`whoami`}

echo ":: install snap"
yay -S snapd
systemctl enable snapd.socket

echo "-----------------------------------------------------------------------"
echo ">>>---> Continue:"
echo " - run install 5 - config files"
