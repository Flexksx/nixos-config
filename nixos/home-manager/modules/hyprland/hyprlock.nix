{
  config,
  inputs,
  pkgs,
  ...
}:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = false;
        no_fade_out = false;
        hide_cursor = false;
        grace = 0;
        disable_loading_bar = true;
      };
      input-field = {
        size = ''250, 60'';
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.35;
        dots_center = true;
        fade_on_empty = false;
        rounding = -1;
        placeholder_text = ''
          <i><span foreground="##cdd6f4">Input Password...</span></i>
        '';
        hide_input = false;
        position = ''0, -200'';
        halign = ''center'';
        valign = ''center'';
      };
    };

  };
}
