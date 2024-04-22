{ ... }:
{
  home.file.tmux = {
		enable = true;
    source = ./tmux.conf;
    target = ".config/tmux/tmux.conf";
  };

	home.file.tpm = {
		enable = true;
		source = ./tpm-init.sh;
		target = ".config/tmux/tpm-init.sh";
		executable = true;
	};
}
