{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      size = lib.mkForce 12;
    };
    settings = {
      enable_audio_bell = false;
      background_blur = 5;
      background_opacity = lib.mkForce 0.75;
    };

  };
}
