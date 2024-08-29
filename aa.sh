#!/bin/bash

# Чтобы удалить все кэшированные версии удалённых пакетов и неиспользуемые базы данных, выполните:
# pacman -Sc --noconfirm

# Чтобы удалить вообще все файлы из кэша, укажите флаг очистки дважды:
# pacman -Scc --noconfirm

# Удалить пакеты, которые больше не требуются как зависимости ("пакеты-сироты"):
# pacman -Rsn --noconfirm $(pacman -Qdtq)

# sudo rm -rf ~/.cache/thumbnails/*

case $1 in
    "upd")
        yay -Syu --noconfirm ;;
    "clear")
        yay -Sc --noconfirm ;;
    "-cA")
        yay -Scc --noconfirm
        yay -Rsn $(pacman -Qdtq) --noconfirm
        sudo rm -rf ~/.cache/thumbnails/* ;;
    "dotfiles")
        bash /home/alex/conf/dotfiles.sh ;;
    "backup")
        bash /home/alex/conf/backup.sh ;;
    *) echo "Unknown command. Try again"
esac
