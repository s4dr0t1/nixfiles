/*
	Name: /modules/default.nix
	Description: Contains packages which don't have any home-manager specific configuration
*/

{ inputs, pkgs, username, ... }:
{
	home-manager.users.${username}.home.packages = with pkgs; [
		# Command line applications
		bat
		patchelf
		ranger

		# Appearance
		la-capitaine-icon-theme
		whitesur-gtk-theme

		# Productivity applications
		#calibre
		#flameshot
		notion-app-enhanced
		obsidian
		#obs-studio
		#vmware-workstation
		#openboard
		#libreoffice

		# Security applications
		checksec
		#tailscale
		wireshark
		#rappel

		# Recreation, social media and messaging
		discord
		jellyfin-media-player
		mpv
		tdesktop
		vimiv-qt


		# Programming
		rustup
		#vscodium
	];
}
