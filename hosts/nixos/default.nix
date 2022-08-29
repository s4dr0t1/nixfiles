/*
	Name: /hosts/nixos/default.nix
	Description: Entry point of the /hosts/nixos directory and contains:
		- Configuration related to different profiles such as laptop, desktop, VM etc
		- Miscellaneous configuration
*/

{ lib, inputs, nixpkgs, home-manager, username, fullname, useremail, hyprland, ... }:
let
	system = "x86_64-linux";
	pkgs = import nixpkgs {
		inherit system;

		#Allow proprietary software
		config.allowUnfree = true;
	};

	lib = nixpkgs.lib;
in
{
	# My laptop profile
	ucciha = lib.nixosSystem {
		inherit system;
		specialArgs = { inherit inputs username useremail fullname hyprland; };

		modules = [
			./ucciha
			hyprland.nixosModules.default
			home-manager.nixosModules.home-manager
		];
	};
}
