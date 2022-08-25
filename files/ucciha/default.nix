{ pkgs, lib, user, ... }:

{
	imports = [
		(./configuration.nix)
		(./hardware-configuration.nix)
		(./home-manager.nix)
	];
}
