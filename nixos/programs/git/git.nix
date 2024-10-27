{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "Flexksx";
    userEmail = "cristian.cretu2808@gmail.com";
    extraConfig = {
      credential = {
        helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
      };
    };
  };
}
