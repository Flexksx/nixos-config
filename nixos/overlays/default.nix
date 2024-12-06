{ inputs, ... }:

{
  additions = final: prev: import ../pkgs { pkgs = prev; };

  modifications = final: prev: { };

  # Define the overlay to include openrazer-daemon directly from unstable
  unstable-packages = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };

  };
  # Add Nixmox overlay to expose its packages and plugins
  nixmox-overlay = final: prev: {
    # Import the Nixmox overlay
    nixmox = import inputs.nixmox.overlay final prev;

    # Expose Nixmox packages for convenience
    oomox = final.nixmox.packages.${final.system}.oomox;
    oomoxFull = final.nixmox.packages.${final.system}.oomoxFull;
    oomoxPlugins = final.nixmox.packages.${final.system}.oomoxPlugins;
  };
}
