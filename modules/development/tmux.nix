/*
	Name: /modules/development/tmux.nix
	Description: Configuration file for the tmux terminal multiplexer
*/

{ username, ... }:
{
	home-manager.users.${username}.programs.tmux = {
		enable = true;

		# Start indexing of windows from 1, and not 0
		baseIndex = 1;

		# Use the 24-hour clock format
		clock24 = false;

		# Set the prefix key
		prefix = "C-a";

		# Store tmux socket under /run instead of /tmp, making it more secure
		secureSocket = true;

		# Set the $TERM environment variable
		terminal = "screen";

		extraConfig =
		''
		# Don't rename windows automatically
		set-option -g allow-rename off

		# Position of the status-line
		set-option -g status-position bottom

		# Making navigation b/w panes easier
		bind h select-pane -L
		bind j select-pane -D
		bind k select-pane -U
		bind l select-pane -R

		# Easier horizontal and vertical splits
		bind-key v split-window -h
		bind-key h split-window -v

		# Status line
		set -g status-justify "left"
		set -g status "on"
		set -g status-style "none,bg=colour234" #b/w left and right
		set -g status-left-style "none"
		set -g status-left-length "100"
		set -g status-left "#[fg=colour247,bg=colour236,bold] #{session_name} #[fg=colour236,bg=colour234,nobold,nounderscore,noitalics]" #session identifier, followed by >
		set -g message-command-style "fg=colour231,bg=colour31"
		set -g pane-active-border-style "fg=colour254"
		set -g message-style "fg=colour231,bg=colour31"
		set -g pane-border-style "fg=colour240"
		set -g status-right-style "none"
		set -g status-right-length "100"
		set -g status-right "#[fg=colour236,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour247,bg=colour236] %Y-%m-%d  %I:%M #[fg=colour252,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour252] #h "
		setw -g window-status-activity-style "none"
		setw -g window-status-separator ""
		setw -g window-status-style "none,fg=colour250,bg=colour234"
		setw -g window-status-format "#[fg=colour244,bg=colour234] #I #[fg=colour250,bg=colour234] #W " #all inactive windows
		setw -g window-status-current-format "#[fg=colour234,bg=colour252,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour252] #I #[fg=colour235,bg=colour252,bold] #W #[fg=colour252,bg=colour234,nobold,nounderscore,noitalics]" #current window
		'';
		};
}
