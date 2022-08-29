/*
	Name: /modules/desktop/xorg/system.nix
	Description: Contains system level (/etc/nixos/configuration.nix) related to the Xorg project
		- Enable the xserver
		- Display managers
		- Desktop managers
*/
{
	services = {
		xserver = {
			enable = true;

			libinput = {
				enable = true;
				touchpad = {
					tapping = true;
					scrollMethod = "twofinger";
				};
			};

			layout = "us";

			displayManager = {
				sddm = {
					enable = true;
				};
			};

			desktopManager = {
				plasma5 = {
					enable = true;
				};
			};
		};
	};
}
