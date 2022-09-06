/*
	Name: /modules/desktop/wayland/hyprland/default.nix
	Description: Acting as a pointer to other Hyprland specific files
*/
{ config, lib, pkgs, ... }:

{
	imports = [
		(./system.nix)
		(./userspace.nix)
	];
}
