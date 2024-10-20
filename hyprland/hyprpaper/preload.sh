#!/bin/bash

# Directory containing the subdirectories
PARENT_DIRECTORY="/home/flexksx/nixos-config/backrgrounds"

# Output file
OUTPUT_FILE="/home/flexksx/nixos-config/hyprland/hyprpaper/hyprpaper.conf"

# Clear the output file if it already exists
> "$OUTPUT_FILE"

# Iterate through each file in the subdirectories
for FILE in "$PARENT_DIRECTORY"/*/*; do
    # Check if it's a file (not a directory)
    if [ -f "$FILE" ]; then
        # Write the preload line to the output file
        echo "preload = $FILE" >> "$OUTPUT_FILE"
    fi
done

echo "Preload paths written to $OUTPUT_FILE."
