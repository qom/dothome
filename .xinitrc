[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

## Other Window Managers

#wmname LG3D
#exec notion
#exec gnome-session
#exec gnome-session --session=gnome-classic

## BSPWM (Binary Space Partitioning Window Manager)

#export PANEL_FIFO="/tmp/panel-fifo"
#export PANEL_HEIGHT=10
#export PATH=$PATH:/home/moveek/.config/bspwm
#export _JAVA_AWT_WM_NONREPARENTING=1

#feh --bg-center /home/moveek/Pictures/walls/City_around_hole.jpg &
#feh --bg-center /home/moveek/Pictures/walls/desert_sand-1920x1080.jpg &

# iBus input method engine variables
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

xsetroot -cursor_name left_ptr
hsetroot -solid "#000000" # Fix for gray background from xcompmgr
xcompmgr -c &
sxhkd &
exec bspwm
