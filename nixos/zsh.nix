{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # plugins = [
    #   {
    #     name = "zsh-nix-shell";
    #     file = "nix-shell.plugin.zsh";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "chisui";
    #       repo = "zsh-nix-shell";
    #       rev = "v0.8.0";
    #       sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
    #     };
    #   }
    # ];
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
        cd nixos-config
        git add *
        cd
      '';
      updflk = ''
        git-add-config-repo 
        sudo nixos-rebuild switch --flake ~/nixos-config/nixos/#nixos
      '';
      updhm = ''
        git-add-config-repo 
        home-manager switch --flake ~/nixos-config/nixos#flexksx@nixos -b backup
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
