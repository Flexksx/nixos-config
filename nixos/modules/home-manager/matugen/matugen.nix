{ inputs, ... }:
{
  imports = [
    inputs.matugen.nixosModules.default
  ];

  programs.matugen = {
    enable = true;
    variant = "dark";
    jsonFormat = "hex";
    palette = "default";

    templates = {
      ags = {
        input_path = "./templates/ags.scss";
        output_path = "~/nixos-config/ags/style/colors.scss";
      };

      gtk4 = {
        input_path = "./templates/gtk-colors.css";
        output_path = "~/.config/gtk-4.0/colors.css";
      };

      gtk3 = {
        input_path = "./templates/gtk-colors.css";
        output_path = "~/.config/gtk-3.0/colors.css";
      };
      waybar = {
        input_path = "./templates/waybar-colors.css";
        output_path = "~/nixos-config/waybar/colors.css";
      };
    };
  };
}
