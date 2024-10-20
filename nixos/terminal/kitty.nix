{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = false;
      enable_audio_bell = true;
      background_opacity = 0.7;
      background_blur = 0.5;
    };
  };
}
