#!/bin/sh

# Keyboard layout
setxkbmap us &

# Display resolution

# Compositor
picom -f --config /home/damian/.config/picom/picom.conf &

# Wallpaper
feh --bg-scale ~/documents/wallpapers/tt5.jpg &

# Status bar

slstatus &

# Execute DWM
exec dwm
