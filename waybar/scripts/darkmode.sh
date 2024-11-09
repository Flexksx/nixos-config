echo "Setting dark mode"
DIR='/home/flexksx/nixos-config/backrgrounds/dark'
BG=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \) | shuf -n 1)

# Apply the wallpaper to all monitors without specifying a monitor
hyprctl hyprpaper wallpaper ", $BG"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# wal -i $BG --saturate 0.4 --cols16 darken
wallust "$BG" --palette softdark16

STYLE_PATH='/home/flexksx/nixos-config/waybar/style.css'
content=$(cat "$STYLE_PATH")
echo "$content" | tee "$STYLE_PATH" > /dev/null
echo "Copied light mode style to waybar/style.css"
echo "Writing wallpaper path to active wallpaper file"
echo $BG > /home/flexksx/nixos-config/waybar/scripts/active_wallpaper_path.txt
HYPRLOCK_CONFIG_PATH='/home/flexksx/nixos-config/hyprland/hyprlock.conf'

# Update the wallpaper path in the Hyprlock config file
sed -i "s|path = .*|path = $BG|g" "$HYPRLOCK_CONFIG_PATH"
echo "Updated Hyprlock config with new wallpaper path"