#!/bin/bash

# Change permissions of apply.sh scripts
chmod +x ~/config/hyprland/apply.sh
chmod +x ~/config/kitty/apply.sh

# Execute the apply.sh scripts
~/config/kitty/apply.sh
~/config/hyprland/apply.sh
