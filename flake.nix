{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.bjorn = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        modules/nixos/configuration.nix
	hardware/bjorn.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}