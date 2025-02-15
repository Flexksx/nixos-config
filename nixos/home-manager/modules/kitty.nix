{
  config,
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      enable_audio_bell = false;
      background_blur = 5;
    };

  };
}
