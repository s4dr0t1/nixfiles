{pkgs, username, ... }:
{
	home-manager.users.${username}.home.packages = with pkgs; [
		# Command line applications
		bat
		patchelf

		# Appearance
		la-capitaine-icon-theme
		whitesur-gtk-theme

		# Productivity applications
		#calibre
		flameshot
		notion-app-enhanced
		obsidian
		#obs-studio
		vmware-workstation
		openboard
		libreoffice

		# Security applications
		checksec
		#tailscale
		wireshark
		#rappel

		# Recreation, social media and messaging
		discord
		jellyfin-media-player
		vlc
		tdesktop

		# Programming
		rustup
		vscodium
	];
}
