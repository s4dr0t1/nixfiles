{ pkgs, lib, username, useremail, fullname, ... }:

{
	imports = [
		(./configuration.nix)
		(./hardware-configuration.nix)
		(./home-manager.nix)
	];
}
