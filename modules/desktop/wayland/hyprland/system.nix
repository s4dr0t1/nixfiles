/*
	Name: /modules/desktop/wayland/hyprland/system.nix
	Description: Contains system wide configuration for the hyprland WM
*/
{ config, lib, pkgs, ... }:

{
	programs = {
		hyprland.enable = true;
	};

	# Hyprland cachix
	nix.settings = {
		substituters = ["https://hyprland.cachix.org"];
		trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
	};
}
