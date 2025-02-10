{
  config,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    # Home Monitors
    monitor = [
      "eDP-1, 3840x2400@60, 5120x370,2"
      "DP-2, 2560x1440@155, 2560x0, 1"
      "DP-3, 2560x1440@130, 0x0, 1"
    ];
    workspace = [
      "1, monitor:DP-3, persistent:true"
      "2, monitor:DP-2, persistent:true"
      "9, monitor:eDP-1, persistent:true"
    ];

  };
}
