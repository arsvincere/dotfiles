#!/bin/bash

# Установка пакетов
yay -S --needed --noconfirm - < packages.txt

# Установка nvim plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Установка zsh, oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

# Установка snap
yay -S snapd
systemctl enable snapd.socket
