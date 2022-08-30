/*
	Name: /hosts/nixos/ucciha/default.nix
	Description: Contains profile level configuration for my laptop (ucciha)
*/
{ pkgs, lib, username, useremail, fullname, ... }:

{
	imports = [
		(./configuration.nix)
		(./hardware-configuration.nix)
		(./home-manager.nix)

		# Use Wayland
		(../../../modules/desktop/wayland)

		# Use X11
		#(../../../modules/desktop/xorg)

		# Applications which don't have any configuration options come under /modules/default.nix (uncategorized ones)
		../../../modules

		# Development
		../../../modules/development/git.nix
		../../../modules/development/neovim.nix
		../../../modules/development/tmux.nix
		../../../modules/development/kitty.nix
		../../../modules/development/starship.nix
		../../../modules/development/fish.nix

		# Security
		../../../modules/security/gpg.nix
		../../../modules/security/dns.nix

		# Utilities
		../../../modules/utilities/chromium.nix
	];
}
