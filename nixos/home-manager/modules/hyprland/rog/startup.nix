{
  config,
  inputs,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "wal -R"
      "hyprpaper"
      "hyprpanel"
      "rog-control-center"
      "asusctl fan-curve -e true --mod-profile Balanced"
      "~/nixos-config/waybar/scripts/restore_theme.sh"
    ];
  };
}
