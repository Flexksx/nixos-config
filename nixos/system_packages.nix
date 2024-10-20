# system_packages.nix
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    google-chrome
    xdg-user-dirs
    kitty
    polkit
    firefox
    git
    ranger
    waybar
    killall
    cmatrix
    lolcat
    htop
    btop
    android-studio
    lxqt.lxqt-policykit
    lm_sensors
    xdg-desktop-portal
    hyprpaper
    nixfmt-rfc-style
    unzip
    unrar
    libnotify
    glib
    wl-clipboard
    openrgb-with-all-plugins
    pciutils
    ffmpeg
    socat
    cowsay
    lshw
    bat
    pkg-config
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
