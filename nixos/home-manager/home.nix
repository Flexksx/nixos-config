{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowunfree = true;
  imports = [
    ./modules/spicetify.nix
    ./modules/ags.nix
    ./modules/rofi.nix
    ./modules/neovim.nix
  ];
  home = {
    username = "flexksx";
    homedirectory = "/home/flexksx";
    stateversion = "24.11";
    packages = with pkgs; [
      spotify-player
      bastet
      themix-gui
      resonance
      inputs.matugen.packages.${system}.default
      inputs.mcmojave-hyprcursor.packages.${pkgs.stdenv.hostplatform.system}.default
      hyprland-autoname-workspaces
    ];
    sessionvariables = {
      hyprcursor_theme = "mcmojave";
    };
  };

  systemd.user.startservices = "sd-switch";
  programs.home-manager.enable = true;
  programs.git.enable = true;

  programs.zathura = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  programs.hyprlock.enable = true;
  gtk = {
    enable = true;
    cursortheme = {
      package = pkgs.bibata-cursors;
      name = "bibata-modern-ice";
    };
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
    icontheme = {
      package = pkgs.papirus-icon-theme;
      name = "papirus";
    };
  };
  qt.enable = true;

}
