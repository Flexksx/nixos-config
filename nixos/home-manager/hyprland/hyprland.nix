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
    ./hyprlock.nix
    ./monitors.nix
    ./startup.nix
    ./plugins.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = "";
    systemd.enable = true;
    #    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    settings = {
      env = [
        "QT_QPA_PLATFORMTHEME,qt5ct "
        "XDG_SESSION_TYPE,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT, auto"
        "LIBVA_DRIVER_NAME, nvidia"
        "NVD_BACKEND, direct"
        "__GLX_VENDOR_LIBRARY_NAME, nvidia"
        "GDM_BACKEND, nvidia-drm"
        "HYPRCURSOR_THEME, McMojave"
        "HYPRCURSOR_SIZE, 36"
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
