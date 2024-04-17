{ ... }:
{
  home.file.tmux = {
		enable = true;
    source = ./tmux.conf;
    target = ".config/tmux/tmux.conf";
  };
}
