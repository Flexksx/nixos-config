{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    syntaxHighlighting = {
      enable = true;
    };
    autosuggestions = {
      enable = true;
    };

    shellAliases = {
      pls = "sudo";

      updflk = ''
        cd ~/config
        git add *
        cd
        sudo nixos-rebuild --flake ~/config/.#ccretu-nixos switch
      '';
      updhm = ''
        home-manager switch --flake /home/ccretu/config/#ccretu@ccretu-nixos -b backup
      '';
      updall = ''
        updflk
        updhm
      '';
    };
    ohMyZsh = {
      enable = true;
      # theme = "powerlevel10k/powerlevel10k";
      plugins = [
        "git"
        "vi-mode"
        "sudo"
        "terraform"
      ];
    };
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  environment.systemPackages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    zsh-completions
  ];
}
