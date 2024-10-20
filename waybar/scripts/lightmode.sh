#!/bin/bash

DIR='/home/flexksx/nixos-config/backrgrounds/light'
BG=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \) | shuf -n 1)

# Apply the wallpaper to all monitors without specifying a monitor
hyprctl hyprpaper wallpaper ", $BG"

# Set the system's color scheme to prefer light mode
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

# Apply the wallpaper using wal with light mode and adjusted saturation
wal -i "$BG" -l --saturate 0.4 --cols16 lighten

# Update the waybar style
STYLE_PATH='/home/flexksx/nixos-config/waybar/style.css'
content=$(cat "$STYLE_PATH")
echo "$content" | tee "$STYLE_PATH" > /dev/null
echo "Copied light mode style to waybar/style.css"
