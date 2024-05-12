#!/bin/bash

again="yes"
while [ "$again" = "yes" ]
do
    echo "What do you want, my Lord?"
    echo "    1. i3"
    echo "    2. update system"
    echo "    3. clear system"
    echo "    0. exit"
    read choice

    case $choice in
        1) startx
            break
            ;;
        2) yay -Syu --noconfirm
            ;;
        3) yay -Scc --noconfirm 
            yay -Rsn $(pacman -Qdtq) --noconfirm 
            sudo rm -rf ~/.cache/thumbnails/*
            ;;
        0) break
            ;;
        *) echo "Try again"
    esac
done

