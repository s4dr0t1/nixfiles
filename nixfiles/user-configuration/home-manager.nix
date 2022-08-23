{ config, pkgs, inputs, ... }:

{
	# Allow unfree packages
	home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;

	home-manager.users.s4dr0t1 = { pkgs, ... }: {
		programs = {
			go.enable = true;
			git = {
				enable = true;
				userName  = "Rohit Dhill";
				userEmail = "s4dr0t1@protonmail.com";
			};
			home-manager.enable = true;
		};
		home = {
			stateVersion = "22.05";
			username = "s4dr0t1";
			homeDirectory = "/home/s4dr0t1";

			packages = with pkgs; [ 
				# Command line applications
				kitty
				bat
				tmux
				starship
				chezmoi
				#nodePackages.npm
				nodejs-16_x
				ripgrep
				patchelf
				fd
				nerdfonts

				# Appearance
				la-capitaine-icon-theme
				whitesur-gtk-theme

				# Productivity applications
				calibre
				flameshot
				notion-app-enhanced
				obsidian
				obs-studio
				vmware-workstation
				openboard
				libreoffice

				# Security applications
				checksec
				tailscale
				wireshark
				rappel

				# Recreation, social media and messaging
				discord
				jellyfin-media-player
				vlc
				tdesktop

				# Programming
				rustup
				vscodium

				# Miscellaneous
				google-chrome
				];
			};
	};
}
