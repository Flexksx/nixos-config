#!/bin/bash

# Change permissions of apply.sh scripts
chmod +x ~/nixos-config/hyprland/apply.sh
chmod +x ~/nixos-config/kitty/apply.sh

# Execute the apply.sh scripts
~/nixos-config/kitty/apply.sh
~/nixos-config/hyprland/apply.sh
