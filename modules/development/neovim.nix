/*
	Name: /modules/development/neovim.nix
	Description: Configuration file for the neovim text editor
*/

{ pkgs, username, ... }:
{
	home-manager.users.${username}.programs.neovim = {
		enable = true;
		package = pkgs.neovim-nightly;
		extraPackages = with pkgs; [
			fd
			ripgrep
			lua53Packages.luarocks
			go
		];
		extraConfig = "";
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		withNodeJs = true;
		withPython3 = false;
		withRuby = false;
	};
}
