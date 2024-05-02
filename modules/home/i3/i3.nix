{ pkgs, ... }:
let 
catppuccin-i3 = pkgs.fetchFromGitHub { 
	owner = "catppuccin"; 
	repo = "i3";
	rev = "HEAD"; 
	hash = "sha256-EHZ/D4PrFqwyTpfcst3+hSx6z4saVD1M9CfFqnWI6io=";
};
in 
{
	xdg.configFile."i3" = {
		source = ./config;
		recursive = true;
	};
}
