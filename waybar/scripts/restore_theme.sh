#!/usr/bin/env bash
# Path to the file containing the last wallpaper path
LAST_WALLPAPER="$HOME/nixos-config/waybar/scripts/active_wallpaper_path.txt"

# Check if the file exists
if [ ! -f "$LAST_WALLPAPER" ]; then
    echo "Error: Wallpaper path file not found at $LAST_WALLPAPER"
    exit 1
fi

# Read the wallpaper path from the file
LAST_WALLPAPER_PATH=$(cat "$LAST_WALLPAPER" | tr -d '\n')
echo "Current wallpaper: $LAST_WALLPAPER_PATH"

# Get the script's directory
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Check if the path contains /dark/ or /light/ and execute appropriate script
if echo "$LAST_WALLPAPER_PATH" | grep -q "/dark/"; then
    echo "Dark theme detected, executing darkmode.sh"
    "$SCRIPT_DIR/darkmode.sh"
elif echo "$LAST_WALLPAPER_PATH" | grep -q "/light/"; then
    echo "Light theme detected, executing lightmode.sh"
    "$SCRIPT_DIR/lightmode.sh"
else
    echo "Error: Wallpaper path doesn't contain /dark/ or /light/ subdirectory"
    exit 1
fi