https://vk.com/arch4u 
Если при установке Arch Linux у кого-то нет второго телефона или компа,
то можно прям на этом же компе набрать команду
> less install.txt
получите актуальную версию установки Arch Linux (Копию Arch Wiki на англ.)

------------------------------------------------------------------------------
                                 Install
------------------------------------------------------------------------------

# Установка раскладки клавиатуры
> loadkeys ru

# Изменим консольный шрифт на тот, который поддерживает кириллицу
setfont cyr-sun16

# Подключаем интернет
- Если не знаете название вашего устройства (device), то пишем:
> ip link

__Через Wi-fi__
Утилита для работы с сетью
> iwctl

Если вы не знаете название своего беспроводного интерфейса, запросите
список всех Wi-Fi устройств:
[iwd]# device list

Если устройство или соответствующий адаптер выключен, включите его:
[iwd]# device устройство set-property Powered on
[iwd]# adapter адаптер set-property Powered on

Затем запустите сканирование сети (команда ничего не выведет):
[iwd]# station устройство scan

После этого можно вывести список обнаруженных сетей:
[iwd]# station устройство get-networks

Наконец, подключитесь к сети:
[iwd]# station _device_ connect _SSID_
Где SSID = название вашей сети
Где device = wlp5s0 или wlan0 (у вас будет свое)
Подробнее https://wiki.archlinux.org/index.php/Iwd#iwctl 

__Проводной интернет__
> dhcpcd

__PC__
4. подключаем USBшку:
ip link set имя_интерфейса up
. Твой модем должен загорется если имеет индикатор.
5. Далее заносим наш пароль и SSID
wpa_passphrase _SSID_ _password_ > /etc/wpa_supplicant.conf
6. подключаемся к сети
wpa_supplicant -B -Dwext -i имя_интерфейса -c /etc/wpa_supplicant.conf
7. Ну и получаем ип адресс:
dhcpcd имя_интерфейса
8. (опционально) проверяем работу с помощью пинга:
ping ya.ru

# Синхронизация системных часов
timedatectl set-ntp true

# Разметка диска
- Смотрим какие диски есть
$ fdisk -l

- Разбиваем диски (для ручной разметки используем fdisk,
для псевдографической разбивки можно использовать команду cfdisk)
> fdisk /dev/sdX
> cfdisk /dev/sdX
В fdisk можно вызвать подсказки нажатием на клавишу “m”

__Создаем таблицу разделов__
- Создаем UEFI - GPT таблицу  командой 'g'
- Создаем MBR таблицу командой 'o'

__Схема разделов BIOS с MBR__ 
mount   Раздел	       Тип раздела	Рекомендуемый размер
[SWAP]	/dev/подкачки  Linux swap   Более 512 МиБ
/mnt	/dev/корневой  Linux	    Остаток - выставить флаг boot командой a

__Схема разделов с UEFI с GPT__
mount       Раздел	              Тип раздела	        Рекомендуемый размер
/mnt/boot 	/dev/раздел_efi       Системный раздел EFI  min 300М, лучше 1GБ
          	                      BIOS boot	            32M
[SWAP]	    /dev/раздел_подкачки  Linux swap	        Более 512 МиБ
/mnt	    /dev/корневой_раздел  Linux x86-64 root     (/)	Остаток

Можно использовать другие точки монтирования, например /mnt/efi,
если используемый загрузчик будет способен загрузить ядро
и initramfs с корневого раздела. Смотрите соответствующее
предупреждение в статье Процесс загрузки Arch#Загрузчик.

1. Создаем новый диск
> n
2. Выбираем primary (основной)  или extented (расширенный)
По умолчанию стоит primary (основной) поэтому просто жмем enter
3. Выбор номера диска, по умолчанию подставляется следующий номер
Просто жмем enter
4. Запрос на первый сектор диска
Просто жмем enter
5. Запрос на последний сектор диска (Ставим + и объем памяти. Пример: +100M)
+100M
Повторяем все шаги снова для всех нужных разделов диска
6. Выставляем флаги
(LEGACY) Для /boot не забываем указать 'a' и поставить 1
    для установки его загрузочным 
(UEFI) Для efi не забываем указать, что это efi раздел t
    и поставить 1 
/dev/sda1 - 512M EFI - выставить флаг EFI командой t 1
/dev/sda2 - 32M BIOS boot - выставить флаг командой t 4
7. Как все разметили не забываем все записать командой w
В итоге можете проверить, что у вас получилось командой fdisk -l

# Форматирование и монтирование разделов
__Разделы с BIOS__
1. Форматирование дисков
mkswap      /dev/sda1 -L swap
mkfs.ext4   /dev/sda2 -L root
2. Монтируем
mount  /dev/sda2 /mnt
swapon /dev/sda1

__Разделы с UEFI__
1. Форматирование дисков
mkfs.fat -F32 /dev/sda1
 mkswap        /dev/sda3 -L swap
mkfs.ext4     /dev/sda4 -L root
2. Монтирование дисков
mount    /dev/sda4 /mnt
mkdir -p /mnt/boot/efi
mount    /dev/sda1 /mnt/boot/efi
swapon   /dev/раздел_подкачки

# Установка
1. Выбор зеркал для загрузки
- Для более быстрой загрузки пакетов настроим зеркала.
Поставим российское зеркало Яндекса выше всех остальных
nano /etc/pacman.d/mirrorlist
- Найдите строку с русским зеркалом (если вы из России) и переместите
его в самый верх. Ctrl+K вырезать строку и Ctrl+U вставить. Зеркало
может отличаться. Ставьте то, которое в вашем mirrorlist
Server = http://mirrors.prok.pw/archlinux/$repo/os/$arch
- Сохраняем Ctr+O (Enter)
- Выходим Ctr+X

- Альтернативный вариант
Поставить рефлектор, который проверит зеркала
на актуальность и скорость и установит лучшие
> pacman -S reflector && reflector --verbose  -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist && pacman -Syyu

# Установка основных пакетов
pacman -Syy
pacman -Sy archlinux-keyring
pacstrap /mnt base base-devel linux linux-firmware netctl dhcpcd neovim networkmanager 

# Генерируем fstab
> genfstab -pU /mnt >> /mnt/etc/fstab

# Перейдём в установленную систему
arch-chroot /mnt


------------------------------------------------------------------------------
                                 arch-chroot
------------------------------------------------------------------------------

# Прописываем имя компьютера.
echo "_name_" > /etc/hostname

# Настроим часы (Для Москвы)
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

# Добавляем локали
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen

# Обновим текущую локаль системы
locale-gen

# Указываем язык системы
echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf

# Указываем keymap для console + прописываем шрифт
echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf

# Создадим загрузочный RAM диск
mkinitcpio -p linux

# Изменим пароль root
passwd

# Установка загрузчика
Обновляем базы данных пакетов:
> pacman -Syy

__для BIOS__
> pacman -S grub
> grub-install /dev/sda

__для UEFI__
> pacman -S grub efibootmgr
> grub-install /dev/sda

Если в системе будут несколько ОС, то это также ставим
> pacman -S os-prober mtools fuse

Обновляем grub.cfg
> grub-mkconfig -o /boot/grub/grub.cfg

Или вручную создаем grub.cfg
 ---------------------------
set default=0
set timeout=0
menuentry "Arch Linux" {
    linux /boot/vmlinuz-linux root=/dev/sda2 rw
    initrd /boot/initramfs-linux.img
}
 ---------------------------
Чтобы защитить файл от любых изменений, присвойте ему атрибут immutable
> chattr +i /boot/grub/grub.cfg

Блокировка защитит файл от перезаписи скриптами установки пакетов. Чтобы избежать конфликта с файлом из пакета, добавьте его имя в строку NoUpgrade в /etc/pacman.conf:
> NoUpgrade = boot/grub/grub.cfg

# Выходим 
exit

# Перезагрузка
reboot

------------------------------------------------------------------------------
                                   Login
------------------------------------------------------------------------------

# Логинимся
логин root
пароль тот, что установили

# Подключаем wifi
wifi-menu

# Если не работает wifi-menu
systemctl start NetworkManager.service
systemctl enable NetworkManager.service

List nearby Wi-Fi networks:
$ nmcli device wifi list

Connect to a Wi-Fi network:
$ nmcli device wifi connect _SSID_ password _****_

Connect to a hidden Wi-Fi network:
$ nmcli device wifi connect SSID_or_BSSID password password hidden yes

Connect to a Wi-Fi on the wlan1 interface:
$ nmcli device wifi connect SSID_or_BSSID password password ifname wlan1 profile_name

Disconnect an interface:
$ nmcli device disconnect ifname eth0

Get a list of connections with their names, UUIDs, types and backing devices:
$ nmcli connection show

Activate a connection (i.e. connect to a network with an existing profile):
$ nmcli connection up name_or_uuid

Delete a connection:
$ nmcli connection delete name_or_uuid

See a list of network devices and their state:
$ nmcli device

Turn off Wi-Fi:
$ nmcli radio wifi off

More info 
https://wiki.archlinux.org/title/NetworkManager

# Или если у вас проводной интернет, то подключаем его
dhcpcd

# Добавляем пользователя
useradd -m -g users -G wheel -s /bin/bash _MYUSERNAME_

# Устанавливаем пароль пользователя
passwd _MYUSERNAME_

# Устанавливаем SUDO
> nano /etc/sudoers
находим строчку # %wheel ALL=(ALL) ALL и раскомментируем ее убрав символ #
Теперь мы можем использовать sudo для выполнения команд администратора.

# Настройка pacman (только для x86_64):
Настроим pacman 
nano /etc/pacman.conf
#Для работы 32-битных приложений в 64-битной системе необходимо раскомментировать репозиторий multilib:
[multilib]
Include = /etc/pacman.d/mirrorlist
#Сохраняем Ctr+O (Enter)
#Выходим Ctr+X

# Обновляем базы данных пакетов:
pacman -Syy

# Установим Х и свободные драйвера
pacman -S xorg-server xorg-drivers xorg-xinit

# Ставим Xfce, lxdm (или sddm)
pacman -S xfce4 xfce4-goodies lxdm

# Ставим шрифты, чтобы можно было читать, что написано. Иначе будут просто квадратики. 
pacman -S ttf-liberation ttf-dejavu

# Ставим менеджер сети
pacman -S network-manager-applet ppp

# Подключаем автозагрузку менеджера входа и интернет (с соблюдением регистра для NetworkManager)
systemctl enable lxdm NetworkManager

# Настройка авто входа без DМ
Копируем файл .xserverrc в каталог пользователя
> cp /etc/X11/xinit/xserverrc ~/.xserverrc
Создаем в домашнем каталоге файл .xinitrc с заданным текстом
> sudo nano ~/.xinitrc
1. Вставляем
 -----------------------------------------------------------
#!/bin/sh
# Xfce передаётся по умолчанию

if [ -f $HOME/.Xresources ]; then
        xrdb -merge $HOME/.Xresources
fi

#session=${1:-openbox}
session=${1:-xfce}

case $session in
awesome ) exec awesome;;
bspwm ) exec bspwm;;
catwm ) exec catwm;;
cinnamon ) exec cinnamon-session;;
dwm ) exec dwm;;
enlightenment ) exec enlightenment_start;;
ede ) exec startede;;
evilwm ) exec evilwm;;
fluxbox ) exec startfluxbox;;
gnome ) exec gnome-session;;
gnome-classic ) exec gnome-session --session=gnome-classic;;
i3 ) exec i3;;
icewm ) exec icewm-session;;
jwm ) exec jwm;;
kde ) exec startkde;;
mate ) exec mate-session;;
monster ) exec monsterwm;;
notion ) exec notion;;
openbox ) exec openbox;;
openbox ) exec openbox-session;;
lxde ) exec startlxde;;
swm ) exec swm;;
unity ) exec unity;;
xfce ) exec startxfce4;;
xmonad ) exec xmonad;;
# No known session, try to run it as command
*) exec $1;;
esac
 -----------------------------------------------------------

2. Открываем
sudo nano ~/.bashrc
Вставляем
 -----------------------------------------------------------
#
# ~/.bashrc
#
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
exec startx
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias tb="nc termbin.com 9999"

alias up="sudo reflector --verbose  -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syyu &&  yay -Syu --noconfirm && sudo pacman -Rsn $(pacman -Qdtq)"
 -----------------------------------------------------------

3. Вводим команду:
> sudo systemctl edit getty@tty1
Вставляем текст:
Вместо Username пишем свой логин
 -----------------------------------------------------------
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin __Username__ --noclear %I $TERM
 -----------------------------------------------------------

4. Отключаем DM (в моем примере это lxdm, у вас может быть свой DM)
sudo systemctl disable lxdm
Перезагружаемся, если все работает, то удаляем DM
sudo pacman -R lxdm

Внимание: Еcли у вас не запускается dbus (есть ошибки) то в ~/.xinitrc добавляем следующий блок перед строкой запуска окружения (например перед exec startkde):
 --
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
   eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi
 --


# Перезагрузка

------------------------------------------------------------------------------
                               Start X-session 
------------------------------------------------------------------------------

# Проприетарные драйвера для видеокарт (Условный пункт)
Если все работает нормально, то можете этот пункт пропустить.
Пакеты lib32-* нужно устанавливать только на x86_64 системы.
Intel:
> sudo pacman -S xf86-video-intel lib32-intel-dri
Nvidia:
> sudo pacman -S nvidia  nvidia-utils  lib32-nvidia-utils
AMD:
> sudo pacman -S xf86-video-ati lib32-ati-dri
Если вы устанавливаете систему на виртуальную машину:
sudo pacman -S xf86-video-vesa

# Установка AUR
Обновляем систему
> sudo pacman -Syu
Создаём yay_install директорию и переходим в неё
> mkdir -p /tmp/yyy
> cd /tmp/yyy
> sudo pacman -S git
> git clone https://aur.archlinux.org/yay.git
> cd yay
> makepkg -sir --needed --noconfirm --skippgpcheck
> rm -rf yyy

# Установка пакетов, которые решают большинство проблем, с которыми вы можете столкнуться
sudo pacman -S f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils file-roller p7zip unrar gvfs aspell-ru pulseaudio 

# Установка программ
sudo pacman -S libreoffice deluge flameshot

# Установка AUR программ
yay -S timeshift

# Установка тем
- Тема для Xfce
yay -S gruvbox-material-gtk-theme-git
- Тема иконок 
yay -S gruvbox-material-icon-theme-git
- Тема курсора 
yay -S volantes-cursors-git
yay -S xcursor-simp1e-gruvbox-dark

- Тема на LXDM
yay -S lxdm-themes
sudo nano /etc/lxdm/lxdm.conf
- Находим строку с  theme=Industrial и заменяем название theme=Archlinux

# Настраиваем горячие клавиши 
xfce4-screenshooter -f  // на скриншот
flameshot gui  // скриншот
xfce4-taskmanager // системный монитор
shutdown -h now  // Быстрое выключение компьютера клавишами

# Настраиваем раскладку клавиатуры
Настройки - клавиатура - раскладка выбираем Shift+Alt

# Включить звук
sudo amixer sset Master unmut

# Auto-login
sudo nano /etc/lxdm/lxdm.conf
Находим строчку #autologin= 
Раскомментируем его убрав # и после = пишем ваш логин в системе

# Делаем BackUp системы
yay -S timeshift

# Убираем меню граб для выбора системы
> sudo nano /etc/default/grub 
GRUB_TIMEOUT=5 меняем на GRUB_TIMEOUT=0
- Обновляем grub.cfg
> sudo grub-mkconfig -o /boot/grub/grub.cfg

# Cтавим conky
> sudo pacman -S conky conky-manager
Конфиги можно скачать в группе и добавить свои https://vk.cc/89e28X 

# Обновление системы
Обновление всей системы (самого ядра, окружения рабочего стола, программ из pacman и из AUR) производится одной командой:
> yay -Syu
- Проверка зеркал (должен стоять рефлектор)
> sudo reflector --verbose  -l 5 -p https --sort rate --save /etc/pacman.d/mirrorlist

# Альтернативная команда для обновления и очистки системы
yay -Syu --noconfirm
sudo pacman -Scc --noconfirm && sudo pacman -Rsn --noconfirm $(pacman -Qdtq) && sudo rm -rf ~/.cache/thumbnails/*

- Пояснения:
yay -Syu - обновляет ядро, программы в pacman и в aur
sudo pacman -Scc - очищает кеш пакетов, высвобождая место на диске
sudo pacman -Rsn $(pacman -Qdtq) - удаляет пакеты-сироты 
sudo rm -rf ~/.cache/thumbnails/* - удаляет миниатюры фото




