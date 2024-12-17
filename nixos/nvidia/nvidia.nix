{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load NVIDIA driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required for optimal functionality.
    modesetting.enable = true;

    # NVIDIA power management (Experimental, disable for stability).
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    # Use the NVIDIA proprietary (non-open) kernel module.
    open = false;

    # Enable the NVIDIA settings menu.
    nvidiaSettings = true;

    # PRIME synchronization settings (if using hybrid GPU setup).
    prime = {
      sync.enable = true;
      amdgpuBusId = lib.mkForce "PCI:06:00:0"; # Replace with the actual AMD GPU Bus ID if needed.
      nvidiaBusId = "PCI:01:00:0"; # Replace with the actual NVIDIA GPU Bus ID if needed.
    };

    # Use the stable NVIDIA driver from the kernel's default package.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
