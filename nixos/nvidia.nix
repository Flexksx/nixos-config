# nvidia.nix
{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental.
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module.
    open = false;

    # Enable the Nvidia settings menu.
    nvidiaSettings = true;
    prime = {
      sync.enable = true;
      amdgpuBusId = lib.mkForce "PCI:06:00:0";
      nvidiaBusId = "PCI:01:00:0";
    };
    # Select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
