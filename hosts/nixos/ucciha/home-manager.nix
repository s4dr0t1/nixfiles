{ config, pkgs, inputs, username, useremail, fullname, ... }:

{
	imports = [
		# Applications which don't have any configuration options come under /modules/default.nix
		../../../modules

		# Development
		../../../modules/development/git.nix
		../../../modules/development/golang.nix
		../../../modules/development/neovim.nix
		../../../modules/development/tmux.nix

		# Security
		../../../modules/security/gpg.nix

		# Utilities
		../../../modules/utilities/chromium.nix
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
