[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## Other Window Managers

#wmname LG3D
#exec notion
#exec gnome-session
#exec gnome-session --session=gnome-classic

## BSPWM (Binary Space Partitioning Window Manager)

export PANEL_FIFO="/tmp/panel-fifo"
export PANEL_HEIGHT=10
export PATH=$PATH:/home/moveek/.config/bspwm

xset +fp /usr/share/fonts/local
xset fp rehash
#feh --bg-center /home/moveek/Pictures/walls/City_around_hole.jpg &
feh --bg-center /home/moveek/Pictures/walls/desert_sand-1920x1080.jpg &
xsetroot -cursor_name left_ptr
sxhkd -f 100 &
exec bspwm
