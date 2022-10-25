/*
	Name: /modules/utilities/syncthing.nix
	Description: Configuration file for syncthing, used for file synchroniSation
*/
{ username, ... }:
{
	home-manager.users.${username}.services.syncthing = {
		enable = true;
		tray.enable = true;
	};
}
