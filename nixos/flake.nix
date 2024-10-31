{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
  };

  outputs =
    { home-manager, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "flexksx"; # update with your actual username
    in
    {
      # Home configuration for your user
      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };

        # Passing inputs as extraSpecialArgs
        extraSpecialArgs = {
          inherit inputs;
        };

        # Import the home.nix configuration
        modules = [ ./home.nix ];
      };
    };
}
