{ config, lib, pkgs, ... }:

{
	programs = {
		hyprland.enable = true;
	};

	environment = {
		loginShellInit = ''
		if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
		exec Hyprland
		fi
		'';
	};
}
