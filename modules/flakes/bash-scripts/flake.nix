{
	description = "Bash scripts";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:  {
			nixosModules.bash-scripts = { pkgs, ... }:
			let
				stdenv = pkgs.stdenv;
				bash-scripts = stdenv.mkDerivation {
						name = "bash-scripts";
						src = ./scripts;
						installPhase = ''
							mkdir -p $out/bin
							cp ./* $out/bin/
							chmod +x $out/bin/*
						'';
					};
			in
			{
				environment.systemPackages = [
					bash-scripts
				];
			};
		};
}
