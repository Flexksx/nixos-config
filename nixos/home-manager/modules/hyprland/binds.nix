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
    "$fileManager" = "nautilus";
    "$menu" = "rofi -show drun";
    "$browser" = "google-chrome-stable";
    "$editor" = "code";
    "$screenshot" = ''
      wl-copy < <(grim -g "$(slurp)" -)
    '';
    "$home" = config.home.homeDirectory;
    bindm = [

      "$mod, mouse:272, movewindow"
    ];
    bind =
      [
        # Apps
        "$mod, Q, exec, $terminal"
        "$mod, E, exec, $fileManager"
        "$mod, R, exec, $menu"
        "$mod, B, exec, $browser"
        "$mod, F, exec, $editor"
        "$mod, Z, exec, $editor $home/config/"
        "$mod, H, exec, $terminal nvim $home/config/home-manager/modules/stylix.nix"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"

        # Window management
        "$mod, C, killactive"
        "$mod, V, togglefloating"

        # Hyprexpo
        "$mod, grave, hyprexpo:expo, toggle"

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
        "$mod, L, exec, hyprlock "
        # Screenshot
        ''$mod, S,exec, $screenshot''
        '', Print, exec, $screenshot''

      ]
      ++ (
        # Workspaces - mod + {1..9} for switching and mod + shift + {1..9} for moving windows
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = toString (i + 1);
            in
            [
              "$mod, ${ws}, workspace, ${ws}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
            ]
          ) 9
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
        ]);

  };
}
