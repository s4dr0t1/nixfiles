/*
	Name: /modules/social/discord.nix
	Description: Contains configuration file for Webcord
*/

{ inputs, pkgs, username, webcord, ... }:
{
	# Fetch the builds from cachix so that you don't have to build them yourself
	nix.settings = {

		substituters = [
			"https://webcord.cachix.org"
		];
		trusted-public-keys = [
			"webcord.cachix.org-1:l555jqOZGHd2C9+vS8ccdh8FhqnGe8L78QrHNn+EFEs="
		];
	};

	home-manager.users.${username}.home = {
		# Run Discord with the --ozone-platform=wayland flag
		sessionVariables.NIXOS_OZONE_WL = "1";
		packages = [
			webcord.packages.${pkgs.system}.default
		];
	};
}
