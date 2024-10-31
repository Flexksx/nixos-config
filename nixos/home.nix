{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ../ags; # Set to `null` if unmanaged
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  # Example to install other packages or manage more options
  home.packages = with pkgs; [
    # Add additional packages here
    vim
    htop
  ];
}
