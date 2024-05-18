{
	# sed "s|\$out|$out|g" ./hyprland.desktop > $out/share/wayland-sessions/${sessionName}.desktop
  description = "Hyprland config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:  {
    nixosModules.hyprland = { config, pkgs, services, ... }:
		let 
			sessionName = "MyHyprland";
			stdenv = pkgs.stdenv;
			hyprland-config = stdenv.mkDerivation {
				name = "hyprland-config";
				src = ./src;
				installPhase = ''
					mkdir -p $out/share/wayland-sessions
					cp -r $src/config $out/config
					cp $src/hyprland.desktop $out/share/wayland-sessions/MyHyprland.desktop
				'';
			} // {
				providedSessions = [ sessionName ];
			};
		in
		{
			environment.sessionVariables = rec {
				HYPRLAND_CONFIG_HOME = "${hyprland-config.out}/config";
			};

			environment.systemPackages = with pkgs; [
				# App launcher
				rofi-wayland

				# Status bar
				polybar
			];

			# Electron hack
			environment.sessionVariables = {
				NIXOS_OZONE_WL = "1";
				ELECTRON_OZONE_PLATFORM_HINT = "wayland";
			};

			programs.hyprland.enable = true;
			services.displayManager = {
				defaultSession = sessionName;
				sessionPackages = [
					hyprland-config
				];
				sddm = {
					enable = true;
					wayland.enable = true;
					autoNumlock = true;
				};
			};
		};
  };
}

