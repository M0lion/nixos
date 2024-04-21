{ ... }:
{
  home.file.tmux = {
		enable = true;
    source = ./tmux.conf;
    target = ".config/tmux/tmux.conf";
		recursive = true;
  };

	home.file.tpm = {
		enable = true;
		source = ./tmux;
		target = ".config/tmux/plugins/catppuccin";
		recursive = true;
	};
}
