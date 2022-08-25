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

			./ucciha/home-manager.nix
			home-manager.nixosModules.home-manager {
				#Allow installation of proprietary software
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;

				#Pass flake variables
				home-manager.extraSpecialArgs = { inherit username; };
#				home-manager.users.${username} = {
#					/*
#						In the future, when you want to maintain multiple machines at once, some
#						of the things will be common to all, such as my GPG key, some applications
#						that are common etc, you may break down the home-manager file into two, 
#						one machine specific and the other one not.
#
#						imports = [(import ./home.nix)] ++ [(import ./folder/home.nix)];
#					*/
#					imports = [
#						(import ./ucciha/home-manager.nix)
#					];
#				};
			}
		];
	};
}
