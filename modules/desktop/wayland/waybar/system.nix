/*
	Name: /modules/desktop/wayland/system.nix
	Description: System level configuration for waybar
*/
{ config, lib, pkgs, ... }:
{
	programs.waybar.enable = true;

	# Waybar needs to be compiled with the experimental flag for wlr/workspaces to work
	nixpkgs.overlays = [
		(self: super: {
			waybar = super.waybar.overrideAttrs (oldAttrs: {
				mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
			});
		})
	];
}
