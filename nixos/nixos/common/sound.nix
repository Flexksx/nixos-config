# sound.nix
{ config, lib, pkgs, ... }: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };
  hardware.pulseaudio.enable = false;
}
