{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [ ];
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
  home = {
    username = "flexksx";
    homeDirectory = "/home/flexksx";
    stateVersion = "24.05";
  };
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  programs.git.enable = true;
}
