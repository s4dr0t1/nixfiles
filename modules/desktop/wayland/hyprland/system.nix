/*
	Name: /modules/desktop/wayland/hyprland/system.nix
	Description: Contains system wide configuration for the hyprland WM
*/
{ config, lib, pkgs, ... }:

{
	programs = {
		hyprland.enable = true;
	};
}
