# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration

    ./common/bluetooth.nix
    ./common/fonts.nix
    ./common/nixpkgs.nix
    ./common/packages.nix
    ./common/razer.nix
    ./common/sound.nix
    ./common/users.nix
    ./common/xdg.nix

    # Extole stuff
    ./extole/extole.nix

    # ThinkPad specific stuff
    ./thinkpad/auto-cpufreq.nix
    ./thinkpad/greetd.nix
    ./thinkpad/hardware-configuration.nix
    ./thinkpad/zsh.nix

  ];

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = [ "nix-command flakes" ];
        flake-registry = "";
        nix-path = config.nix.nixPath;
        trusted-users = [
          "root"
          "ccretu"
        ];
        substituters = [ "https://cache.nixos.org/" ];
      };

      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.configurationLimit = 30;
  boot.loader.systemd-boot.configurationLimit = 30;

  networking.hostName = "ccretu-nixos";
  networking.networkmanager.enable = true;
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "ccretu";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };
  services.openssh = {
    enable = true;
  };
  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.videoDrivers = [ "modesetting" ];
  system.autoUpgrade.enable = true;
  system.stateVersion = config.system.nixos.release;
  time.timeZone = "Europe/Chisinau";

  programs.ssh.startAgent = true;
  programs.hyprland.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
