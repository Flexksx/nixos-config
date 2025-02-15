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
    ];
    packages = with pkgs; [
      firefox
      tree
    ];
  };
}
