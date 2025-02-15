{
  config,
  pkgs,
  ...
}:
{

  systemd.user.startServices = "sd-switch";
}
