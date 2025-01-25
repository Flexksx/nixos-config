{
  config,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
    ];
  };
}
