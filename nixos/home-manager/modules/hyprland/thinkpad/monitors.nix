{
  config,
  pkgs,
  ...
}: let
  homeMonitors = [
    "eDP-1, 3840x2400@60, 5120x370,2"
    "DP-2, 2560x1440@155, 2560x0, 1"
    "DP-3, 2560x1440@130, 0x0, 1"
  ];
  homeWorkspaces = [
    "1, monitor:DP-3, persistent:true"
    "2, monitor:DP-2, persistent:true"
    "9, monitor:eDP-1, persistent:true"
  ];
  workMonitors = [
    "eDP-1, 3840x2400@60, 1570x1440,2"
    "HDMI-A-1, 2560x1440@60, 2560x0, 1"
    "DP-3, 2560x1440@60, 0x0, 1"
  ];
  workWorkspaces = [
    "1, monitor:DP-3, persistent:true"
    "2, monitor:HDMI-A-1, persistent:true"
    "9, monitor:eDP-1, persistent:true"
  ];
  useWorkSetup = false;
in {
  wayland.windowManager.hyprland.settings = {
    monitor =
      if useWorkSetup
      then workMonitors
      else homeMonitors;
    workspace =
      if useWorkSetup
      then workWorkspaces
      else homeWorkspaces;
  };
}
