{
	description = "Bash scripts";

	inputs = {};

	outputs = { self, ... }:
		{
			nixosModules.bash-scripts = { pkgs, ... }:
			let
				stdenv = pkgs.stdenv;
			in
			{
				environment.systemPackages = {
					(stdenv.mkDerivation {
						name = "bash-scripts";
						src = ./scripts;
						installPhase = ''
							mkdir -p $out/bin
							cp ./* $out/bin/
							chmod +x $out/bin/*
						'';
					};)
				};
			};
		};
}
