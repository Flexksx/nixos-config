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
        "QT_QPA_PLATFORMTHEME,qt5ct "
        "XDG_SESSION_TYPE,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT, auto"
        "LIBVA_DRIVER_NAME, nvidia"
        "NVD_BACKEND, direct"
        "__GLX_VENDOR_LIBRARY_NAME, nvidia"
        "GDM_BACKEND, nvidia-drm"
        "HYPRCURSOR_THEME, McMojave"
        "HYPRCURSOR_SIZE, 36"
      ];
    };
  };
}
