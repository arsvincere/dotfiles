#!/bin/bash

udf update
yay -Syu --noconfirm

# Чтобы удалить все кэшированные версии удалённых пакетов и неиспользуемые базы данных, выполните:
# pacman -Sc --noconfirm 

# Чтобы удалить вообще все файлы из кэша, укажите флаг очистки дважды:
# pacman -Scc --noconfirm 

# Удалить пакеты, которые больше не требуются как зависимости ("пакеты-сироты"):
# pacman -Rsn --noconfirm $(pacman -Qdtq) 

# sudo rm -rf ~/.cache/thumbnails/*

