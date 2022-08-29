/*
	Name: flake.nix
	Description: Root project file for my NixOS configuration
*/

{
	description = "s4dr0t1's system configuration";

	/*
		Specify dependencies used to build my system, which are similar to nix-channels
		To update dependencies: nix flake update
	*/
	inputs = {
		# Core dependencies
		# Nixpkgs repository for NixOS 22.05
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		# Used to maintain userspace configuration
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Miscellaneous stuff

		# Rust toolchain and rust-analyzer nightly for Nix
		# fenix = {
		# 	url = "github:nix-community/fenix";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };

	};

	# Function which tells my flake with to do with the dependencies
	outputs = inputs @ { self, nixpkgs, home-manager, hyprland, ... }: 
		let
			username = "s4dr0t1";
			fullname = "Rohit Dhill";
			useremail = "s4dr0t1@protonmail.com";
		in
		{
			# NixOS configuration, other supported options are darwinConfigurations (for Darwin)and homeConfigurations (for non-NixOS based systems)
			nixosConfigurations = (
				import ./hosts/nixos {
					inherit (nixpkgs) lib;
					inherit inputs nixpkgs home-manager username fullname useremail hyprland;
				}
			);
		};
}
