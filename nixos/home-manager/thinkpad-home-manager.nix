# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/hyprland.nix
    ./modules/kdeconnect.nix
    ./modules/kitty.nix
    ./modules/neovim.nix
    ./modules/nixpkgs.nix
    ./modules/obs.nix
    ./modules/packages.nix
    ./modules/qt.nix
    ./modules/rofi.nix
    ./modules/spicetify.nix
    ./modules/stylix.nix
    ./modules/systemd.nix
    ./modules/zathura.nix

    # Hyprland config
    ./modules/hyprland.nix
    ./modules/hyprland/thinkpad/monitors.nix
    ./modules/hyprland/thinkpad/env.nix
    ./modules/hyprland/thinkpad/startup.nix
  ];

  home = {

    username = "ccretu";
    homeDirectory = "/home/ccretu";
    stateVersion = "24.11";

  };

  programs.git.userEmail = "ccretu@extole.com";
  programs.home-manager.enable = true;

}
