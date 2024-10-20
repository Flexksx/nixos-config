#!/bin/bash
echo "Setting dark mode"
DIR='/home/flexksx/nixos-config/backrgrounds/dark'
BG=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \) | shuf -n 1)

# Apply the wallpaper to all monitors without specifying a monitor
hyprctl hyprpaper wallpaper ", $BG"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# wal -i $BG --saturate 0.4 --cols16 darken
wallust "$BG" 

STYLE_PATH='/home/flexksx/nixos-config/waybar/style.css'
content=$(cat "$STYLE_PATH")
echo "$content" | tee "$STYLE_PATH" > /dev/null
echo "Copied light mode style to waybar/style.css"
