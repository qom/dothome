xset +fp /usr/share/fonts/local
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec notion
#exec ck-launch-session gnome-session
#xmonad
#exec monsterwm
