#!/bin/bash

# Автозапуск NetworkManager
systemctl start NetworkManager.service
systemctl enable NetworkManager.service

# Подключаем wifi
nmcli device wifi list
# nmcli device wifi connect Keenetic-8471 password Q2Wobiko
nmcli device wifi connect alexavin password 32167321

# Добавляем пользователя
echo "add user 'alex'"
useradd -m -g users -G wheel -s /bin/bash alex

# Устанавливаем пароль пользователя
echo "Enter passwd for alex:"
passwd alex

## Allow members of group wheel to execute any command
sudo echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Same thing without a password
sudo echo "%wheel ALL=(ALL:ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

echo "Continue:"
echo " - reboot"
echo " - login as alex"
echo " - run install 4 - packages"
