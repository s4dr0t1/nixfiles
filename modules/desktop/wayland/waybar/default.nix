/*
	Name: /modules/desktop/wayland/waybar/default.nix
	Description: 
		- Waybar is a fast and extremely customisable Polybar replacement for Wayland
		- Acting as a pointer to other files in the waybar directory
*/
{ config, lib, pkgs, ... }:

{
	imports = [
		./system.nix
		./user.nix
	];
}
