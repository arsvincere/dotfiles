#!/bin/bash

yay -Syu --noconfirm
pacman -Scc --noconfirm 
pacman -Rsn --noconfirm $(pacman -Qdtq) 
# sudo rm -rf ~/.cache/thumbnails/*

