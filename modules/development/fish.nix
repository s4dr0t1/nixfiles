/*
	Name: /modules/development/fish.nix
	Description: Configuration file for the fish shell
*/

{ username, ... }:
{
	home-manager.users.${username}.programs.fish = {
		enable = true;
		# For example, when we type gs<space> in the terminal, it will get expanded to git status
		shellAbbrs = {
			"gs" = "git status";
			"gd" = "git diff";
			"gc" = "git commit -S -m";
		};
		# Similar to the normal shell aliases
		shellAliases = {
			"tmux" = "tmux -u";
			"man" = "man -P \"bash -c 'col -b | nvim -c \\\"set ft=man nomod nolist\\\" -'\"";
			"cat" = "bat";
		};
		functions = {
			# Disable the initial greeting by fish
			fish_greeting = "";
		};
	};
}
