{ pkgs, lib, username, ... }:

{
	imports = [
		(./configuration.nix)
		(./hardware-configuration.nix)
		(./home-manager.nix)
	];
}
