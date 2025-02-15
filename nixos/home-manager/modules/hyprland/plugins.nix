{
  config,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
    ];

    settings = {
      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          enable_gesture = true;
          gesture_positive = true;
          gesture_distance = 300;
          bg_col = "rgb(111111)";
          workspace_method = "center current";
        };
      };
    };
  };
}
