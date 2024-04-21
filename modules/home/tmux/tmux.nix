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
		source = ./tpm;
		target = ".config/tmux/plugins/tpm";
		recursive = true;
	};
}
