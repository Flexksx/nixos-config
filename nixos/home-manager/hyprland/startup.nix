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
      "waybar -c /home/flexksx/nixos-config/waybar/config.jsonc -s /home/flexksx/nixos-config/waybar/style.css"
      "rog-control-center"
      "asusctl fan-curve -e true --mod-profile Balanced"
      "~/nixos-config/waybar/scripts/restore_theme.sh"
    ];
  };
}
