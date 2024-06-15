if [ -f $HOME/.Xresources ]; then
        xrdb -merge $HOME/.Xresources
fi

# export DRI_PRIME=1
# exec i3
# exec awesome
# exec dwm
exec qtile start
