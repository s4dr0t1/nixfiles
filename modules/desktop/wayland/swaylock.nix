/*
	Name: /modules/desktop/wayland/swaylock.nix
	Description: Contains file screen locking in Wayland
*/
{ pkgs, config, username, ... }:
{
	# https://github.com/NixOS/nixpkgs/issues/143365#issue-1038436173
	security.pam.services.swaylock = {};

	home-manager.users.${username} = {
		programs.swaylock = {
			settings = {
				# General settings
					# Detach from the controlling terminal after locking
					daemonize = true;

					# Don't validate empty passwords
					ignore-empty-password = true;

					# Show the total number of failed password attempts
					show-failed-attempts = true;

					# Password grace period, so that the password doesn't need to be entered until the grace period has passed
						grace = 1;

					# The indicator is only visible after the grace period
						indicator-idle-visible = true;

					# Don't show the circle during grace mode
						indicator = false;

				# Lock-screen effects
					image = "$HOME/Pictures/lock";
					effect-blur = "20x2";
					scaling = "fill";

					# Making the lock-screen fade-in instead of just popping it
					fade-in = "0.2";

					line-color = "094129172";
					text-color = "236239244";
					inside-ver-color = "129161193";
					line-ver-color = "129161193";
					ring-ver-color = "129161193";
					ring-color = "116144173";
					key-hl-color = "103128154";
					separator-color = "103128154";
					layout-text-color = "236239244";
					line-wrong-color = "19197106";

				# Clock, date, and other things indicator
					clock = true;
					datestr = "%F";
					timestr = "%T";

					indicator-radius = "180";
					indicator-thickness = 75;

					# Font settings
					font = "Meslo";
					font-size = 50;
			};
		};
	};
}
