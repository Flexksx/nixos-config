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
      git-add-config-repo = ''
        cd 
        cd config
        git add *
        cd
      '';
      updflk = ''
        git-add-config-repo 
        sudo nixos-rebuild switch --flake ~/config/nixos/#nixos
      '';
      updhm = ''
        git-add-config-repo 
        home-manager switch --flake ~/config/nixos#flexksx@nixos -b backup
      '';
      updall = ''
        updflk
        updhm
      '';

    };
    ohMyZsh = {
      enable = true;
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
