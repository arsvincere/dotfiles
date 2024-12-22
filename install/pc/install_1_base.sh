#!/bin/bash

# Установка раскладки клавиатуры
loadkeys ru

# Изменим консольный шрифт на тот, который поддерживает кириллицу
setfont cyr-sun16

# Подключаем интернет
# wpa_passphrase Keenetic-8471 Q2Wobiko > /etc/wpa_supplicant.conf
wpa_passphrase alexavin 32167321 > /etc/wpa_supplicant.conf
wpa_supplicant -B -Dwext -i wlan0 -c /etc/wpa_supplicant.conf
dhcpcd wlan0

timedatectl set-ntp true

# Разметка диска
# fdisk -l
# fdisk /dev/sda

# Форматирование дисков
mkswap      /dev/sda1 -L swap
mkfs.ext4   /dev/sda2 -L root

# Монтирование дисков
mount  /dev/sda2 /mnt
swapon /dev/sda1

# Установка основных пакетов
pacman -Syy
pacman -Sy archlinux-keyring
pacstrap /mnt base base-devel linux linux-firmware dhcpcd neovim networkmanager

# Генерируем fstab
genfstab -pU /mnt >> /mnt/etc/fstab

echo "-----------------------------------------------------------------------"
echo ">>>---> Continue:"
echo "- unmount flash"
echo "- arch-chroot /mnt"
echo "- mount flash"
echo "- run scritp part 2 - chroot"

