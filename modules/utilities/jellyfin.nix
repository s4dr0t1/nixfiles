/*
	Name: /modules/utilities/jellyfin.nix
	Description:
		- Configuration files for Jellyfin
		- Jellyfin is a free software media system, that allows us to collect, manage, and stream our media.
*/
{ config, lib, pkgs, username, ... }:
{
	services.jellyfin = {
		enable = true;
		user = "${username}";
		group = "users";
		openFirewall = true;
	};
}
