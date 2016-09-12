[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

## Other Window Managers

#wmname LG3D
#exec notion
#exec gnome-session
#exec gnome-session --session=gnome-classic

## BSPWM (Binary Space Partitioning Window Manager)

#export PANEL_FIFO="/tmp/panel-fifo"
#export PANEL_HEIGHT=10
#export PATH=$PATH:/home/moveek/.config/bspwm

#feh --bg-center /home/moveek/Pictures/walls/City_around_hole.jpg &
#feh --bg-center /home/moveek/Pictures/walls/desert_sand-1920x1080.jpg &

xsetroot -cursor_name left_ptr
hsetroot -solid "#000000" # Fix for gray background from xcompmgr
xcompmgr -c &
sxhkd &
exec bspwm
