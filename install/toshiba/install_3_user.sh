#!/bin/bash

echo ":: connecting to internet"
systemctl start NetworkManager.service
systemctl enable NetworkManager.service
nmcli device wifi list
nmcli device wifi connect Keenetic-8471 password Q2Wobiko

echo ":: add user 'alex'"
echo "add user 'alex'"
useradd -m -g users -G wheel -s /bin/bash alex

echo ">> enter passwd for alex:"
passwd alex

echo ":: add in sudoers"
sudo echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

echo ":: set 'pacman' without passwd"
sudo echo "%wheel ALL=(ALL:ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

echo "-----------------------------------------------------------------------"
echo ">>>---> Continue:"
echo " - unmount flash"
echo " - reboot"
echo " - login as alex"
echo " - run install 4 - packages"
