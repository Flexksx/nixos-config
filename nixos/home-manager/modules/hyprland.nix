{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hyprland/appearance.nix
    ./hyprland/binds.nix
    ./hyprland/hyprlock.nix
    ./hyprland/plugins.nix
    ./hyprland/hyprlock.nix
    ./hyprland/hypridle.nix
    ./hyprland/hyprpanel.nix
    ./hyprland/hyprland_packages.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = "";

    settings = {
      env = [
        "NIXOS_OZONE_WL, 1"
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
      layerrule = [
        "noanim, hyprnotch"
      ];
    };
  };
}
