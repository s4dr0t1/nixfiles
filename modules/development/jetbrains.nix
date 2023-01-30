/*
	Name: /modules/development/jetbrains.nix
	Description: Configuration for Jetbrains products
*/

{ inputs, pkgs, username, ... }:
{
	home-manager.users.${username}.home.packages = with pkgs; [
		jetbrains.clion
	];
}
