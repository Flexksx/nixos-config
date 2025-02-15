{
  config,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        "HYPRCURSOR_THEME, McMojave"
        "HYPRCURSOR_SIZE, 36"
        "QT_QPA_PLATFORMTHEME,qt5ct "
        "XDG_SESSION_TYPE,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT, auto"
      ];
    };
  };
}
