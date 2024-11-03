{
  config,
  pkgs,
  lib,
  ...
}:
{
  users.users.flexksx = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "openrazer"
      "adbusers"
      "docker"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
    ];
  };
}
