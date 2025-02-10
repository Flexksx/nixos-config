{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./appearance.nix
    ./binds.nix
    ./monitors.nix
    ./startup.nix

  ];
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = "";
    systemd.enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage =
    #   inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
    ];
    settings = {
      env = [
        "QT_QPA_PLATFORMTHEME,qt5ct "
        "XDG_SESSION_TYPE,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT, auto"
      ];
      cursor = {
        no_hardware_cursors = true;
      };
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = "yes";
          clickfinger_behavior = true;
        };

        sensitivity = 0; # -1.0 to 1.0, 0 means no modification.
      };
      gestures = {
        workspace_swipe = "on";
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
    };
  };
}
