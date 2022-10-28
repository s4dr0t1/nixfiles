/*
	Name: /hosts/nixos/ucciha/default.nix
	Description: Acting as a pointer to other configuration files which are to be used by the ucciha host
*/
{ pkgs, lib, username, useremail, fullname, webcord, ... }:

{
	imports = [
		# Core
		(./configuration.nix)
		(./hardware-configuration.nix)
		(./home-manager.nix)

		# Overlays
		(../../../overlays)

		# Display server protocol
		(../../../modules/desktop/wayland)
		#(../../../modules/desktop/xorg)

		# Applications which don't have any configuration options come under /modules/default.nix (uncategorised ones)
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
		../../../modules/utilities/librewolf.nix
		../../../modules/utilities/jellyfin.nix
		../../../modules/utilities/syncthing.nix

		# Social apps
		../../../modules/social/discord.nix

		# Virtualization
		../../../modules/virtualization/vbox.nix
	];
}
