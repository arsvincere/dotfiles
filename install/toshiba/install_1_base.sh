#!/bin/bash

# Разметка диска
# fdisk -l
# fdisk /dev/sda

echo ":: format disk"
mkswap      /dev/sda1 -L swap
mkfs.ext4   /dev/sda2 -L root

echo ":: mount disk"
swapon /dev/sda1
mount  /dev/sda2 /mnt

echo ":: set keyborad layot 'ru'"
loadkeys ru

echo ":: set console font (for cyrilic)"
setfont cyr-sun16

echo ":: connecting to internet"
wpa_passphrase Keenetic-8471 Q2Wobiko > /etc/wpa_supplicant.conf
wpa_supplicant -B -Dwext -i wlan0 -c /etc/wpa_supplicant.conf
dhcpcd wlan0

echo ":: sync date time"
timedatectl set-ntp true

echo ":: install base packages"
pacman -Syy
# pacman -Sy archlinux-keyring
pacstrap /mnt base base-devel linux linux-firmware netctl dhcpcd networkmanager neovim helix

echo ":: gen fstab"
genfstab -pU /mnt >> /mnt/etc/fstab

echo "-----------------------------------------------------------------------"
echo ">>>---> Continue:"
echo " - unmount flash"
echo " - arch-chroot /mnt"
echo " - mount flash"
echo " - run scritp part 2 - chroot"

