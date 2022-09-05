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
				show-failed-attempts = true;
				daemonize = true;
				image = "$HOME/Pictures/lock";
				scaling = "fill";

				font = "Meslo";
				datestr = "%F";
				timestr = "%T";
				font-size = 50;

				grace = 1;
				fade-in = "0.2";
				clock = true;
				indicator = true;
				indicator-radius = "180";
				indicator-thickness = 75;
				indicator-idle-visible = true;

				effect-blur = "20x2";
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
			};
		};
	};
}
