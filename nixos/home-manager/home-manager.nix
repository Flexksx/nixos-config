{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [ <home-manager/nixos> ];
  home-manager.users.flexksx = {
    home = {
      stateVersion = "24.05";
      pointerCursor = {
        name = "Adwaita";
        package = pkgs.gnome.adwaita-icon-theme;
        size = 24;
        x11 = {
          enable = true;
          defaultCursor = "Adwaita";
        };
      };
    };
  };
}
