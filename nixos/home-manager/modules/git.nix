{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "Flexksx";
    aliases = {
      a = "add";
      cm = "commit -m";
      co = "checkout";
      s = "status";
      br = "branch";
    };
    extraConfig = {
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };
}
