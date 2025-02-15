{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "flexksx";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };
}
