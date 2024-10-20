#!/bin/bash

# Source directory containing your custom fonts
SOURCE_DIR="/home/flexksx/nixos-config/fonts"

# Destination directory for system fonts
DEST_DIR="/usr/share/fonts"

# Iterate over each file in the source directory and copy it to the destination directory
for font_file in "$SOURCE_DIR"/*; do
    sudo cp "$font_file" "$DEST_DIR"
done

# Refresh the font cache
sudo fc-cache -fv

echo "Fonts have been copied and the font cache has been refreshed."