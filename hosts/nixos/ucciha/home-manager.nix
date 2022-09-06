/*
	Name: /hosts/nixos/ucciha/home-manager.nix
	Description: Basic configuration file for home-manager
*/
{ config, pkgs, inputs, username, useremail, fullname, ... }:

{
	home-manager = {
		# Allow unfree packages
		useGlobalPkgs = true;
		useUserPackages = true;

		# Userspace configuration for s4dr0t1
		users.${username} = { pkgs, ... }: {
			programs = {
				# Letting home-manager manage itself
				home-manager.enable = true;
			};
			home = {
				username = "${username}";
				homeDirectory = "/home/${username}";
				stateVersion = "22.05";
			};
		};
	};

}
