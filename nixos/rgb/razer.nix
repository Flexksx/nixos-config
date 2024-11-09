{
  config,
  lib,
  pkgs,
  ...
}:

{
  hardware.openrazer = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    # polychromatic
    unstable.polychromatic
  ];

}
