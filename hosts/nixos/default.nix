/*
	Name: /hosts/nixos/default.nix
	Description:
		- Entry point of the /hosts/nixos directory
		- Contains:
			- Configuration files of different hosts with NixOS installed, such as laptop/ desktop/ VM etc.
*/

{ inputs, nixpkgs, home-manager, username, fullname, useremail, hyprland, webcord, ... }:
let
	system = "x86_64-linux";

	/*
		When we're referencing pkgs, the target system we want the package for
		and the allowUnfree trait, will be assumed automatically.
	*/
	pkgs = import nixpkgs {
		inherit system;

		#Allow proprietary software
		config.allowUnfree = true;
	};
in
{
	# My laptop profile
	ucciha = nixpkgs.lib.nixosSystem {
		inherit system;
		specialArgs = { inherit inputs username useremail fullname webcord; };

		modules = [
			./ucciha
			hyprland.nixosModules.default
			home-manager.nixosModules.home-manager
		];
	};
}
