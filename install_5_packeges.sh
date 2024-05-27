#!/bin/bash

# Установим Х и свободные драйвера
# pacman -S xorg-server xorg-drivers xorg-xinit

# Установка Git
pacman -S git

# Установка AUR
pacman -Syu
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -sir --needed --noconfirm --skippgpcheck
cd ..
rm -rf yay

# Установка пакетов, которые решают большинство проблем, с которыми вы можете столкнуться
# f2fs-tools - SSD support
# dosfstools - The dosfstools package includes the mkfs.fat and fsck.fat utilities, which respectively make and check MS-DOS FAT filesystems
sudo pacman -S --needed --noconfirm f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils file-roller p7zip unrar gvfs aspell-ru pulseaudio 

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
yay -S snapd
systemctl enable snapd.socket
