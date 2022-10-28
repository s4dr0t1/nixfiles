/*
	Name: /modules/Virtualization/vbox.nix
	Description: Configuration file for Oracle Virtualbox
*/

{ config, lib, pkgs, inputs, ... }:
{
	virtualisation.virtualbox = {
		host = {
			enable = true;

			# Hardened version of virtual box
			enableHardening = true;

			# Run virtualbox in headless mode
			headless = false;

			# Install the extension pack for VirtualBox
			enableExtensionPack = true;
		};
	};
}
