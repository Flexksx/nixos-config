{
  inputs,
  pkgs,
  config,
  ...
}:
{
  services.swaync = {
    enable = true;
  };
}
