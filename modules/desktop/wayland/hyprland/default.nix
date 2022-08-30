{ config, lib, pkgs, ... }:

{
	imports = [
		(./system.nix)
		(./userspace.nix)
	];
}
