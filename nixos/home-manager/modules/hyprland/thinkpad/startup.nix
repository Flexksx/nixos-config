{
  config,
  inputs,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprpanel"
      "hyprpaper"
    ];
  };
}
