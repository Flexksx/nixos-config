{
  config,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 7.5;
      gaps_out = 15;
      border_size = 0;
      resize_on_border = true;
      layout = "dwindle";

      allow_tearing = false;
    };
    decoration = {
      rounding = 12;
      shadow = {
        enabled = true;
        range = 4;
        render_power = 1;
      };
      blur = {
        enabled = true;
        size = 4;
        new_optimizations = true;
        passes = 2;
        contrast = 0.4;
        ignore_opacity = false;
      };

    };

    animations = {
      enabled = "yes";

      bezier = [
        "easeOutBack, 0.175, 0.885, 0.32, 1.275"
        "easeOutQuad, 0.25, 0.46, 0.45, 0.94"
        "easeOutQuart, 0.165, 0.84, 0.44, 1"
        "easeOutCubic, 0.215, 0.61, 0.355, 1"
        "easeOutSine, 0.39, 0.575, 0.565, 1"
        "easeOutExpo, 0.19, 1, 0.22, 1"
        "easeOutCirc, 0.075, 0.82, 0.165, 1"
        "easeOutElastic, 0.68, -0.55, 0.265, 1.55"
        "easeOutBounce, 0.68, -0.55, 0.265, 1.55"
        "easeOutQuint, 0.23, 1, 0.32, 1"
        "easeInOutBack, 0.68, -0.55, 0.265, 1.55"
        "easeInBack, 0.6, -0.28, 0.735, 0.045"
        "easeInQuart, 0.895, 0.03, 0.685, 0.22"
        "easeInCubic, 0.55, 0.055, 0.675, 0.19"
        "easeInSine, 0.47, 0, 0.745, 0.715"
        "easeInExpo, 0.95, 0.05, 0.795, 0.035"
        "easeInCirc, 0.6, 0.04, 0.98, 0.335"
        "easeInElastic, 1, -0.5, 0.735, 0.035"
        "easeInBounce, 0.68, -0.55, 0.265, 1.55"
        "easeInQuint, 0.755, 0.05, 0.855, 0.06"
      ];

      animation = [
        "windows, 1, 7, easeInQuint, popin 50%"
        "windowsIn, 1, 2, easeInBack, popin 50%"
        "windowsOut, 1, 7, easeOutElastic, popin 40%"
        "windowsMove, 1, 3, easeOutCirc, popin 50%"
        "border, 1, 10, easeInBounce"
        "borderangle, 1, 8, easeOutBounce"
        "fade, 1, 2, easeInQuint"
        "workspaces, 1, 1.6, easeInSine"
      ];
    };
  };
}
