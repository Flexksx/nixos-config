{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  home = {
    username = "flexksx";
    homeDirectory = "/home/flexksx";
    stateVersion = "24.05";
  };
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.ags = {
    enable = true;
    configDir = ../../ags;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
  };
  programs.hyprlock.enable = true;
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };
  qt.enable = true;
}
