# system_packages.nix
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    google-chrome
    xdg-user-dirs
    home-manager
    kitty
    polkit
    nwg-look
    firefox
    git
    ranger
    waybar
    killall
    cmatrix
    postman
    lxappearance
    lolcat
    btop
    rhythmbox
    nodejs-18_x
    mpvpaper
    openjdk17
    lxqt.lxqt-policykit
    lm_sensors
    fh
    blueman
    bluez
    xdg-desktop-portal
    fragments
    vlc
    clementine
    pass
    cbonsai
    android-studio
    clang
    cmake
    xdg-desktop-portal-gnome
    hyprpaper
    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.th_TH
    cava
    poetry
    gsettings-desktop-schemas
    nixfmt-rfc-style
    unzip
    unrar
    libnotify
    glib
    wl-clipboard
    openrgb-with-all-plugins
    gnupg
    pinentry
    pciutils
    ffmpeg
    socat
    cowsay
    lshw
    bat
    pkg-config
    p7zip
    gnome.file-roller
    zip
    meson
    hyprpicker
    ninja
    brightnessctl
    appimage-run
    networkmanagerapplet
    playerctl
    discord
    swww
    grim
    slurp
    swaynotificationcenter
    imv
    mpv
    gimp
    pavucontrol
    greetd.tuigreet
    neofetch
    wallust
    vscode
    rofi-wayland
    telegram-desktop
    slack
    spotify
  ];
}
