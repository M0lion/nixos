if [ -d "$TMUX_PLUGIN_MANAGER_PATH" ]; then
	cd $TMUX_PLUGIN_MANAGER_PATH/tpm
	git pull
else
	mkdir -p $TMUX_PLUGIN_MANAGER_PATH
	git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_PATH/tpm
fi
