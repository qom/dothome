#wmname LG3D
#exec notion
#exec ck-launch-session gnome-session

export PANEL_FIFO="/tmp/panel-fifo"
export PANEL_HEIGHT=10
export PATH=$PATH:/home/moveek/.config/bspwm

xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset fp rehash
sxhkd -f 100 &
exec bspwm
