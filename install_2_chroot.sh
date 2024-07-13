#!/bin/bash

# Прописываем имя компьютера.
echo "pc" > /etc/hostname

# Настроим часы (Для Москвы)
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

# Добавляем локали
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen

# Обновим текущую локаль системы
locale-gen

# Указываем язык системы
echo 'LANG="en_US.UTF-8"' > /etc/locale.conf

# Указываем keymap для console + прописываем шрифт
echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf

# Создадим загрузочный RAM диск
mkinitcpio -p linux

# Изменим пароль root
echo ">>>---> set root passwd"
passwd

# Установка загрузчика
pacman -S grub
grub-install /dev/sda

# Копируем конфиг grub
cp config/grub/grub.cfg /boot/grub/grub.cfg

echo "-----------------------------------------------------------------------"
echo ">>>---> Continue:"
echo "- exit"
echo "- reboot"
echo "- login as root"
echo "- install 3 user"

