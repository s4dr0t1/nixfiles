/*
	Name: /modules/development/git.nix
	Description: Configuration file for git
*/

{ fullname, useremail, username, ... }:
{
	home-manager.users.${username}.programs.git = {
		enable = true;
		userName  = "${fullname}";
		userEmail = "${useremail}";
#		extraConfig = {
#		};

		delta = {
			enable = true;
			# https://github.com/dandavison/delta
			options = {
				side-by-side = true;
				line-numbers = true;
			};
		};
	};
}
