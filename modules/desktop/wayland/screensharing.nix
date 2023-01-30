/*
	Name: /modules/desktop/wayland/screensharing.nix
	Description: Contains configuration for screensharing
*/
{ pkgs, config, username, ... }:
{
	xdg.portal.wlr = {
		enable = true;
	};
}
