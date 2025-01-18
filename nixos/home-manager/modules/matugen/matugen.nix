{ inputs, ... }:
{
  imports = [
    inputs.matugen.homeManagerModules.default
  ];

  programs.matugen = {
    enable = true;
    variant = "dark";
    jsonFormat = "hex";

    templates = {
      ags = {
        input_path = "/home/flexksx/nixos-config/nixos/home-manager/modules/matugen/templates/ags.scss";
        output_path = "/home/flexksx/nixos-config/ags/style/colors.scss";
      };

      gtk4 = {
        input_path = "/home/flexksx/nixos-config/nixos/home-manager/modules/matugen/templates/gtk-colors.css";
        output_path = "/home/flexksx/.config/gtk-4.0/colors.css";
      };

      gtk3 = {
        input_path = "/home/flexksx/nixos-config/nixos/home-manager/modules/matugen/templates/gtk-colors.css";
        output_path = "/home/flexksx/.config/gtk-3.0/colors.css";
      };

      gtk3alt = {
        input_path = "/home/flexksx/nixos-config/nixos/home-manager/modules/matugen/templates/gtk-colors.css";
        output_path = "/home/flexksx/nixos-config/nixos/home-manager/gtk-styles/gtk3colors.css";
      };

      gtk4alt = {
        input_path = "/home/flexksx/nixos-config/nixos/home-manager/modules/matugen/templates/gtk-colors.css";
        output_path = "/home/flexksx/nixos-config/nixos/home-manager/gtk-styles/gtk4colors.css";
      };

      waybar = {
        input_path = "/home/flexksx/nixos-config/nixos/home-manager/modules/matugen/templates/waybar-colors.css";
        output_path = "/home/flexksx/nixos-config/waybar/colors.css";
      };
    };
  };
}
