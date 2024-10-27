{ config, pkgs, ... }:

let
  openrgbRules = builtins.readFile ./60-openrgb.rules; # Directly read file
in
{
  boot.kernelModules = [
    "i2c-dev"
    "i2c-piix4"
  ];
  services.udev.extraRules = builtins.toString openrgbRules; # Just read file content
}
