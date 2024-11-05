# pkgs/default.nix
{ pkgs, ... }:

{
  # Define example package here using callPackage
  example = pkgs.callPackage ./example { };
}
