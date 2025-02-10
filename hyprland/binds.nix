{
  config,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$fileManager" = "thunar";
    "$menu" = "rofi -show drun";
    "$browser" = "google-chrome-stable";
    "$editor" = "code";
    bind =
      [
        # Apps
        "$mod, Q, exec, $terminal"
        "$mod, E, exec, $fileManager"
        "$mod, R, exec, $menu"
        "$mod, B, exec, $browser"
        "$mod, F, exec, $editor"
        "$mod, Z, exec, $editor /home/ccretu/config/"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"

        # Window management
        "$mod, C, killactive"
        "$mod, V, togglefloating"

        # Media keys
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioPlay, exec, playerctl play-pause"

        # Volume control
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Brightness
        ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"

        # Lock screen
        "$mod, L, exec, hyprlock -c /home/ccretu/config/hyprland/hyprlock.conf"

        # Restart Waybar
        "$mod SHIFT, W, exec, /home/ccretu/config/waybar/restart.sh"
      ]
      ++ (

        # Workspaces - $mod + [shift +] {0..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, ${toString ws}, workspace, ${toString ws}"
              "$mod SHIFT, ${toString ws}, movetoworkspace, ${toString ws}"
            ]
          ) 10
        )
      )
      ++ (
        # Navigation between workspaces
        [
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
        ])
      ++ (
        # Scroll between workspaces
        [
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"
        ])
      ++ (
        # Window resize
        [
          "$mod, mouse:272, movewindow"
        ]);
  };
}
