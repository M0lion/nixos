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
  home.file.i3 = {
		enable = true;
    source = ./config;
    target = ".config/i3/";
		recursive = true;
  };

	xdg.configFile."i3/Catppuccin Latte.theme".source = "${catppuccin-i3}/themes/catppuccin-mocha";
}
