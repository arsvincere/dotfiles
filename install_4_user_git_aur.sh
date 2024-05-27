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

echo "Continue:"
echo " - reboot"
echo " - login as alex"
echo " - run install 5 - user packages"
