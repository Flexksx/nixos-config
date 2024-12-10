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
    inputs.ags.homeManagerModules.default
    inputs.walker.homeManagerModules.default
  ];
  home = {
    username = "flexksx";
    homeDirectory = "/home/flexksx";
    stateVersion = "24.11";
    packages = with pkgs; [
      spotify-player
      bastet
      themix-gui
      resonance
      inputs.matugen.packages.${system}.default
      inputs.mcmojave-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
      hyprland-autoname-workspaces
    ];
    sessionVariables = {
      HYPRCURSOR_THEME = "McMojave";
    };
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
      fzf
      inputs.ags.packages.${pkgs.system}.battery
      inputs.ags.packages.${pkgs.system}.hyprland
    ];
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
    extraConfig = ''
      set runtimepath+=~/nixos-config/neovim
    '';

  };

  xdg.configFile.nvim.source = ../../neovim;

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
