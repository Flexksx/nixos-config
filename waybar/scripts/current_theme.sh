#!/bin/bash

current_theme=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ $current_theme == "'prefer-dark'" ]]; then
    echo " 🌕 "
else
    echo " ☀️ "
fi
