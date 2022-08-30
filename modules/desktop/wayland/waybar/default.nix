{ config, lib, pkgs, ... }:
{
	imports = [
		./system.nix
		./user.nix
	];
}
