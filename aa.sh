#!/bin/bash

# Чтобы удалить все кэшированные версии удалённых пакетов и неиспользуемые базы данных, выполните:
# pacman -Sc --noconfirm

# Чтобы удалить вообще все файлы из кэша, укажите флаг очистки дважды:
# pacman -Scc --noconfirm

# Удалить пакеты, которые больше не требуются как зависимости ("пакеты-сироты"):
# pacman -Rsn --noconfirm $(pacman -Qdtq)

# sudo rm -rf ~/.cache/thumbnails/*

case $1 in
    "update")
        yay -Syu --noconfirm ;;
    "clear")
        yay -Sc --noconfirm ;;
    "-cA")
        yay -Scc --noconfirm
        yay -Rsn $(pacman -Qdtq) --noconfirm
        sudo rm -rf ~/.cache/thumbnails/* ;;
    "dotfiles")
        bash /home/alex/conf/dotfiles.sh update ;;
    "backup")
        bash /home/alex/conf/backup.sh ;;
    "archive")
        bash /home/alex/conf/archive.sh ;;
    "upd_all")
        bash /home/alex/conf/archive.sh
        bash /home/alex/conf/backup.sh
        bash /home/alex/conf/dotfiles.sh update
        yay -Syu --noconfirm
        yay -Scc --noconfirm
        yay -Rsn $(pacman -Qdtq) --noconfirm
        sudo rm -rf ~/.cache/thumbnails/*
        ;;
    *) echo "Unknown command. Try again"
esac
