{ config, pkgs, inputs, username, useremail, fullname, ... }:

{
	imports = [
	];

	home-manager = {

		# Allow unfree packages
		useGlobalPkgs = true;
		useUserPackages = true;

		# Userspace configuration for s4dr0t1
		users.s4dr0t1 = { pkgs, ... }: {
			programs = {
				# Letting home-manager manage itself
				home-manager.enable = true;
			};
			home = {
				sessionVariables = {
					EDITOR = "nvim";
					VISUAL = "nvim";
				};
				stateVersion = "22.05";
				username = "${username}";
				homeDirectory = "/home/${username}";
				};
		};
	};

}
