{ ... }:
{
	programs.tmux.enable = true;

  home.file.tmux = {
    source = ./config;
    target = ".config/tmux";
  };
}
