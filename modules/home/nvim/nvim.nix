{ ... }:
{
	programs.neovim.enable = true;

  home.file.nvim = {
    source = ./config;
    target = ".config/nvim";
  };
}
