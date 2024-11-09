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

    # Make openrazer-daemon accessible directly in the overlay
    openrazer-daemon = final.unstable.openrazer-daemon.overrideAttrs (oldAttrs: rec {
      version = "3.9.0"; # Set the desired version

      src = final.fetchFromGitHub {
        owner = "openrazer";
        repo = "openrazer";
        rev = "v3.9.0";
        sha256 = "MLwhqLPWdjg1ZUZP5Sig37RgZEeHlU+DyELpyMif6iY=";
      };
    });
  };
}
