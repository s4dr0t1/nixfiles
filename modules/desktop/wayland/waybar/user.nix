/*
	Name: /modules/desktop/wayland/waybar/user.nix
	Description: Userspace configuration for waybar
	Important links:
		- https://github.com/Alexays/Waybar/wiki/Configuration
*/
{ username, ...}:
{
	home-manager.users.${username} = {
		home.file.".config/waybar/config.jsonc".source = ./files/config.jsonc;
		home.file.".config/waybar/style.css".source = ./files/style.css;

		programs.waybar = {
		# https://github.com/Alexays/Waybar/wiki/Configuration
			enable = true;

			# systemd integration with waybar
			systemd.enable = true;
		};

	};
}
