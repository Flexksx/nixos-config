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
      "eDP-1, 1920x1080@144, 5120x370,1"
      "DP-1, 2560x1440@155, 2560x0, 1"
      "HDMI-A-1, 2560x1440@130, 0x0, 1"
    ];
    workspace = [
      "1, monitor:HDMI-A-1, persistent:true"
      "2, monitor:DP-1, persistent:true"
      "9, monitor:eDP-1, persistent:true"
    ];

  };
}
