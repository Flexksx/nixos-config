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
    settings = {
      enable_audio_bell = false;
      background_blur = 5;
      background_opacity = lib.mkForce 0.7;
    };

  };
}
