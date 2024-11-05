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
      update = "sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --flake /home/flexksx/nixos-config/nixos#nixos";
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
