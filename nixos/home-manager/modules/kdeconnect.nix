{
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  services.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
    indicator = true;
  };
}
