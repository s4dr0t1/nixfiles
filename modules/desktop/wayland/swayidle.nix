/*
	Name: /modules/desktop/wayland/swayidle.nix
	Description: Contains the configuration file to handle the IDLE status
*/

{ pkgs, username, ... }:
{
	home-manager.users.${username}.services.swayidle = {
		enable = true;

		/*
			Run commands on the basis of events
			The following events are registered:
				- Pause the player before going to sleep
				- Lock the screen before going to sleep
				- Lock the screen on the "lock" event
		*/
		events = [
			{
				event = "before-sleep";
				command = "${pkgs.playerctl}/bin/playerctl pause";
			}
			{
				event = "before-sleep";
				command = "${pkgs.swaylock-effects}/bin/swaylock";
			}
			{
				event = "lock";
				command = "${pkgs.swaylock-effects}/bin/swaylock";
			}
		];

		/*
			Commands to run after idle timeout
			The following events are defined:
				- Decrease the brightness after a specific time and resume it during override
				- Lock the screen after a specific time and pause the music player
				- Suspend the system after a specific time
		*/
		timeouts = [
			{
				timeout = 300;
				command = "${pkgs.brightnessctl}/bin/brightnessctl set 30%-";
				resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl set 30%+";
			}
			{
				timeout = 600;
				command = "${pkgs.playerctl}/bin/playerctl pause";
			}
			{
				timeout = 600;
				command = "${pkgs.swaylock-effects}/bin/swaylock";
			}
			{
				timeout = 900;
				command = "${pkgs.systemd}/bin/systemctl suspend";
			}
		];
	};
}
