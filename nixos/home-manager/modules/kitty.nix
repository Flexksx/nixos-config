{
  config,
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Ubuntu Mono";
      size = 12;
    };
    shellIntegration.enableZshIntegration = true;
    settings = {
      background_blur = 4;
      background_opacity = 0.7;
      enable_audio_bell = false;
    };
    extraConfig = ''
      include ~/.config/wallust/dist/colors-kitty.conf
    '';
  };
}
