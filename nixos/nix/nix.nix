{
  config,
  pkgs,
  lib,
  ...
}:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
  };
}
