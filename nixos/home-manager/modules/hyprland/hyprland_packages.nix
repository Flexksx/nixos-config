{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    flameshot
    grim
    slurp
    hyprpaper
    inputs.matugen.packages.${system}.default
    inputs.mcmojave-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprland-autoname-workspaces
    hyprpicker
    brightnessctl
  ];
}
