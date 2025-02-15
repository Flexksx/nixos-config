{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}:
{

  imports = [
    ./modules/ags.nix
    ./modules/git.nix
    ./modules/gtk.nix
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
    ./modules/swaync.nix
    ./modules/systemd.nix
    ./modules/zathura.nix

    # Hyprland config
    ./modules/hyprland.nix
    ./modules/hyprland/rog/monitors.nix
    ./modules/hyprland/rog/env.nix
    ./modules/hyprland/rog/startup.nix
  ];
  home = {
    username = "flexksx";
    homeDirectory = "/home/flexksx";
    stateVersion = "24.11";

  };
  programs.git.userEmail = "cristian.cretu2808@gmail.com";
  programs.home-manager.enable = true;

}
