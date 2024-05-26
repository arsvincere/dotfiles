if [ -f $HOME/.Xresources ]; then
        xrdb -merge $HOME/.Xresources
fi

exec i3
# exec awesome

