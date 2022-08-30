{ pkgs, username, ...}:
{

	home-manager.users.${username} = {
		home.file.".config/rofi/theme.rasi".source = ./files/theme.rasi;
		home.file.".config/rofi/image.png".source = ./files/image.png;

		programs.rofi = {
			enable = true;
			package = pkgs.rofi-wayland;
			font = "Meslo LGS Nerd Font 10";
			location = "center";
			terminal = "\${pkgs.kitty}/bin/kitty";
			theme = "theme.rasi";
			extraConfig = {
				# What modes are enabled
				modi = "drun,run,filebrowser";

				# Icons
				show-icons = true;
				icon-theme = "la-capitaine";

				# Icons for the enabled modes
				display-run = "";
				display-drun = "";
				display-power = "";
				display-filebrowser = "";
				drun-display-format = " {name}";

			};
		};
	};
}
