/*
	Name: /hosts/nixos/ucciha/default.nix
	Description: Contains profile level configuration for my laptop (ucciha)
*/
{ pkgs, lib, username, useremail, fullname, ... }:

{
	imports = [
		(./configuration.nix)
		(./hardware-configuration.nix)
		(./home-manager.nix)

		# Use Wayland
		(../../../modules/desktop/wayland)

		# Use X11
		#(../../../modules/desktop/xorg)
	];
}
