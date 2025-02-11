{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./modules/spicetify.nix
    ./modules/ags.nix
    ./modules/rofi.nix
    ./modules/neovim.nix
    ./modules/swaync.nix
    ./hyprland/hyprland.nix
    ./modules/kitty.nix
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

  };
  programs.git = {
    enable = true;
    userName = "Flexksx";
    userEmail = "cristian.cretu2808@gmail.com";
    extraConfig = {
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

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
