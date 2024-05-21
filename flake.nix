	{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		hyprland = {
			url = "./modules/flakes/hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = { self, nixpkgs, hyprland, ... }@inputs: {
    nixosConfigurations.bjorn = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
				modules/nixos/configuration.nix
				hardware/bjorn-nix.nix
				machines/bjorn-nix.nix
        inputs.home-manager.nixosModules.default
				hyprland.nixosModules.hyprland
      ];
    };
    nixosConfigurations.bjorn-home = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
				modules/nixos/configuration.nix
				hardware/bjorn-home.nix
				machines/bjorn-home.nix
        inputs.home-manager.nixosModules.default
				hyprland.nixosModules.hyprland
      ];
    };
  };
}
