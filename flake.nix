/*
	Name: flake.nix
	Description: Root project file for my Nix configuration

	Author: Rohit Dhill <s4dr0t1@protonmail.com>
	URL: https://github.com/s4dr0t1/nixfiles
	License: CC0
*/

{
	description = "s4dr0t1's system configuration";

	/*
		Specify dependencies used to build my system, which are similar to nix-channels
		To update dependencies: nix flake update
	*/
	inputs = {
		# Core
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# WM
		hyprland = {
			url = "github:hyprwm/Hyprland";
		};

		# Additional flakes
			# FOSS Discord client
			webcord = {
				url = "github:fufexan/webcord-flake";
			};

			# Mainly for screenshot functionality
			hyprwm-contrib = {
				url = "github:hyprwm/contrib";
			};
	};

	# Function which tells my flake with to do with the dependencies
	outputs = inputs @ { self, nixpkgs, home-manager, hyprland, webcord, hyprwm-contrib, ... }: 
		let
			# Variables which will be used throughout this configuration
			username = "s4dr0t1";
			fullname = "Rohit Dhill";
			useremail = "s4dr0t1@protonmail.com";
		in
		{
			/*
				- Configuration for NixOS
				- Other supported options are:
					- darwinConfigurations (macOS)
					- homeConfigurations (for non-NixOS based systems)

				- /hosts/nixos will contain configuration regarding all the machines which have NixOS installed

				- If in the future, you have macOS/ any other OS with the Nix package manager installed,
				consider making a different folder of each one of them /hosts/darwin and /hosts/nonos,
				or something like that
			*/
			nixosConfigurations = (
				import ./hosts/nixos {
					inherit (nixpkgs) lib;
					inherit inputs nixpkgs home-manager username fullname useremail hyprland webcord hyprwm-contrib;
				}
			);
		};
}
