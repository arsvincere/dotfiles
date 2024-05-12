#!/bin/bash

# Добавляем пользователя
echo "add user 'alex'"
useradd -m -g users -G wheel -s /bin/bash alex

# Устанавливаем пароль пользователя
echo "Enter passwd for alex:"
passwd alex

## Uncomment to allow members of group wheel to execute any command
sudo echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Same thing without a password
sudo echo "%wheel ALL=(ALL:ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

# Установим Х и свободные драйвера
pacman -S xorg-server xorg-drivers xorg-xinit

# Настройка авто входа без DМ
pacman -S xorg-xinit

# Установка Git
pacman -S git
git config --global user.name "arsvincere"
git config --global user.email "mr.alexavin@gmail.com"

# Установка AUR
pacman -Syu
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -sir --needed --noconfirm --skippgpcheck
rm -rf yay

# Установка пакетов, которые решают большинство проблем, с которыми вы можете столкнуться
sudo pacman -S --needed --noconfirm f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils file-roller p7zip unrar gvfs aspell-ru pulseaudio 

echo "Continue:"
echo " - reboot"
echo " - login as alex"
echo " - run install 5 - user packages"
