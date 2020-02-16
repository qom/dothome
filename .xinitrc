[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Added Xft.dpi setting in .Xresources so commenting this (affected firefox and chrome scaling).
#export GDK_SCALE=2

#sxhkd &
exec i3
