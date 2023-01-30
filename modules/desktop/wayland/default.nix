/*
	Name: /modules/desktop/wayland/default.nix
	Description: Points to other files related to configuration related to the Wayland display server protocol
*/
{ config, lib, pkgs, ... }:

{
	imports = [
		# System level configuration related to Wayland
		(./hyprland)
		(./rofi)
		(./waybar)
		(./swaylock.nix)
		(./swayidle.nix)
		(./screensharing.nix)
	];
}
