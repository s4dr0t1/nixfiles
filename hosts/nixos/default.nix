/*
	Name: ./files/default.nix
	Description: The starting file of the ./files subdirectory containing pointers to other files
*/

{ lib, inputs, nixpkgs, home-manager, username, ... }:
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
		specialArgs = { inherit inputs username; };

		modules = [
			./ucciha
			home-manager.nixosModules.home-manager
		];
	};
}
