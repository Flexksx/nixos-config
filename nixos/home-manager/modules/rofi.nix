{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        configuration = {
          modi = "drun";
          show-icons = true;
          display-drun = "";
          drun-display-format = "{name}";
        };

        "*" = {
        };

        "window" = {
          transparency = mkLiteral "\"real\"";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = false;
          width = mkLiteral "750px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";
          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "12px";
          cursor = mkLiteral "\"default\"";
        };

        "mainbox" = {
          enabled = true;
          spacing = mkLiteral "20px";
          margin = mkLiteral "0px";
          padding = mkLiteral "20px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          children = map mkLiteral [
            "inputbar"
            "listview"
          ];
        };

        "inputbar" = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "15px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          children = map mkLiteral [
            "prompt"
            "entry"
          ];
        };

        "prompt" = {
          enabled = true;
        };

        "textbox-prompt-colon" = {
          enabled = true;
          expand = false;
          str = "::";
        };

        "entry" = {
          enabled = true;
          cursor = mkLiteral "text";
          placeholder = "Search";
        };

        "listview" = {
          enabled = true;
          columns = 5;
          lines = 3;
          cycle = true;
          dynamic = true;
          scrollbar = false;
          layout = mkLiteral "vertical";
          reverse = false;
          fixed-height = true;
          fixed-columns = true;
          spacing = mkLiteral "0px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          cursor = mkLiteral "\"default\"";
        };

        "scrollbar" = {
          handle-width = mkLiteral "5px";
          border-radius = mkLiteral "0px";
        };

        "element" = {
          enabled = true;
          spacing = mkLiteral "15px";
          margin = mkLiteral "0px";
          padding = mkLiteral "20px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          orientation = mkLiteral "vertical";
          cursor = mkLiteral "pointer";
        };

        "element normal.normal" = {
        };

        "element selected.normal" = {
        };

        "element-icon" = {
          size = mkLiteral "64px";
          cursor = mkLiteral "inherit";
        };

        "element-text" = {
          highlight = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.5";
        };

        "error-message" = {
          padding = mkLiteral "15px";
          border = mkLiteral "2px solid";
          border-radius = mkLiteral "10px";
        };

        "textbox" = {
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
          highlight = mkLiteral "none";
        };
      };
  };
}
