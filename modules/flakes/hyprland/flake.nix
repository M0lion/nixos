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
					mkdir -p $out/bin
					cp -r $src/config $out/config
					cp $src/hyprland.desktop $out/share/wayland-sessions/MyHyprland.desktop
					echo "Hyprland --config $out/config/hyprland.conf" > $out/bin/MyHyprland.sh
					chmod +x $out/bin/MyHyprland.sh
					echo "echo $out" > $out/bin/hyprland-config
					chmod +x $out/bin/hyprland-config
					echo "cp $(hyprland-config)/config/hyprland.conf ~/.config/hypr/hyprland.conf" > $out/bin/hyprland-reload
					chmod +x $out/bin/hyprland-reload
				'';
			} // {
				providedSessions = [ sessionName ];
			};
		in
		{
			environment.systemPackages = with pkgs; [
				# App launcher
				rofi-wayland

				# Status bar
				polybar

				hyprland-config
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

