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
      "rog-control-center"
      "asusctl fan-curve -e true --mod-profile Balanced"
    ];
  };
}
