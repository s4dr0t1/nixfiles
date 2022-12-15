/*
	Name: /modules/default.nix
	Description: Contains packages which don't have any home-manager specific configuration
*/

{ inputs, pkgs, username, ... }:
{
	home-manager.users.${username}.home.packages = with pkgs; [

	# Programming
		# Hex editor
		imhex

		# Debugging
		gdb
		gef

		# Command line applications
		bat 						# Better replacement for cat
		patchelf						# Messing with ELF binaries
		ranger						# CLI file manager

		# Appearance
		la-capitaine-icon-theme
		whitesur-gtk-theme

		# Productivity applications
		#calibre
		#flameshot
		notion-app-enhanced				# Note taking
		obsidian						# Note taking
		#obs-studio
		#vmware-workstation
		#openboard
		#libreoffice

		# Security applications
		checksec						# Checking security based properties of binaries
		#tailscale
		wireshark						# Protocol analysis
		#rappel

		# Recreation, social media and messaging
		jellyfin-media-player				# Player for self hosted media system
		mpv						# VLC alternative
		tdesktop						# Telegram desktop
		vimiv-qt						# Image viewer


		# Programming
		rustup							# Getting latest builds of rust utilities
		#vscodium
	];
}
