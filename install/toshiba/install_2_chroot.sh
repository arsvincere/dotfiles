#!/bin/bash

echo ":: set hostname"
echo "toshiba" > /etc/hostname

echo ":: set localtime Moscow"
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

echo ":: set locales"
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo ":: set locale 'en'"
echo 'LANG="en_US.UTF-8"' > /etc/locale.conf

echo ":: set keymap & console font"
echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf

echo ":: mkinitcpio"
mkinitcpio -p linux

# Изменим пароль root
echo ">> set root passwd:"
passwd

echo ":: download grub"
pacman -S grub

echo ":: install grub"
grub-install /dev/sda

echo ":: copy grub.cfg"
cp config/grub/grub.cfg /boot/grub/grub.cfg

echo "-----------------------------------------------------------------------"
echo ">>>---> Continue:"
echo "- unmount flash"
echo "- exit"
echo "- reboot"
echo "- login as root"
echo "- install 3 user"

