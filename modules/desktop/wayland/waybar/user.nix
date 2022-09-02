/*
	Name: /modules/desktop/wayland/waybar/user.nix
	Description: Userspace configuration for waybar
	Important links:
		- https://github.com/Alexays/Waybar/wiki/Configuration
*/
{ pkgs, username, ...}:
{
	home-manager.users.${username} = {
#		home.file.".config/waybar/config.jsonc".source = ./files/config.jsonc;
#		home.file.".config/waybar/style.css".source = ./files/style.css;

		programs.waybar = {
		# https://github.com/Alexays/Waybar/wiki/Configuration
			enable = true;

			# systemd integration with waybar
			systemd.enable = true;

			settings = {
				topBar = {
					position = "top";
					layer = "top";
					height = 25;
					output = [
							"eDP-1"
					];
					modules-left = [
						"wlr/workspaces"
					];
					modules-center = [
						"clock"
					];
					modules-right = [
						"network"
						"pulseaudio"
						"cpu"
						"memory"
						"backlight"
						"battery"
					];
					"wlr/workspaces" = {
						disable-scroll = true;
						all-outputs = true;
						on-click = "activate";
						format = "{icon}";
						persistent_workspaces = {
							"1" = [];
							"2" = [];
							"3" = [];
							"4" = [];
							"5" = [];
							"6" = [];
							"7" = [];
							"8" = [];
							"9" = [];
							"10"= [];
						};
					};
					backlight = {
						device = "intel_backlight";
						format = "{icon} {percent}%";
						format-icons = [
							""
							""
							""
							""
							""
							""
							""
						];
						on-scroll-up = "${pkgs.brightnessctl}/bin/brightnessctl set 1%+";
						on-scroll-down = "${pkgs.brightnessctl}/bin/brightnessctl set 1%-";
						min-length = 6;
					};
					battery = {
						# The interval in which the information gets polled.
						interval = 60;
						# The maximum length in character the module should display.
						max-length = 25;
						# A number of battery states which get activated on certain capacity levels.
						states = {
							"good"= 95;
							"warning"= 30;
							"critical"= 20;
						};
						# How it should be displayed
						format = "{capacity}% <span font='11'>{icon}</span>";
						format-charging = "{capacity}% ";
						format-plugged = " {capacity}%";
						format-alt = "{time} {icon}";
						format-icons = [
							""
							""
							""
							""
							""
							""
							""
							""
							""
							""
							""
						];
					};
					clock = {
						# How it should be displayed
						format = "{:%b %d %H:%M} <span font='15'></span>";
						format-alt = "{:%A, %B %d, %Y} ";
						tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
					};
					memory = {
						format = "{used:0.1f}/{total:0.1f} G <span font='14'></span>";
						interval = 1;
					};
					cpu = {
						format = "{usage}% <span font='15'></span>";
						interval = 1;
						tooltip = false;
					};
					network = {
						format-alt = "{ifname}: {ipaddr}/{cidr}";
						format-wifi = "<span font='15'></span>  {essid}";
						format-ethernet = "<span font='15'></span> {essid}";
						format-linked = "{ifname} (No IP) <span font='15'></font>";
						format-disconnected = "<span font='15'>睊</font> Disconnected";
						tooltip-format-wifi = "Strength: {signalStrength}% | Down: {bandwidthDownBits}, Up: {bandwidthUpBits}";
					};
					pulseaudio = {
						format = "{volume}% {icon} {format_source}";
						format-bluetooth = "{volume}% {icon} {format_source}";
						format-bluetooth-muted = " {icon} {format_source}";
						format-muted = "婢 {format_source}";
						format-source = "{volume}% ";
						format-source-muted = "";
						scroll-step = 1;
						format-icons = {
							headphone = "";
							hands-free = "";
							headset = "";
							phone = "";
							portable = "";
							car = "";
							default = [
								"奄"
								"奔"
								"墳"
							];
						};
					};
				};
			};

			style = 
			''
			* {
				/* These properties apply to all*/
				border: none;
				border-radius: 0;
				font-family: MesloLGS Nerd Font;
				font-size: 14px;
				min-height: 0;
			}

			/* The background of the waybar */
			window#waybar {
				background: #161616;
				color: #f2f4f8;
			}

			tooltip {
				/* Tooltip shows up when we hover over something */
				background: #161616;
				border-radius: 10px;
				border-width: 2px;
				border-style: solid;
				border-color: transparent;
			}

			#workspaces button {
				/* Non-active workspace button */
				padding: 5px;
				color: #2a2a2a;
				margin-right: 5px;
			}

			#workspaces button.active {
				/* Active workspace button */
				color: #ffffff;
			}

			#workspaces button.focused {
				color: #161616;
				background-color: #161616;
				border-radius: 10px;
			}

			#workspaces button.urgent {
				color: #161616;
				background-color: #f2f4f8;
				border-radius: 10px;
			}

			/* These settings apply when we hover over the workspace number */
			#workspaces button:hover {
				color: #161616;
				background-color: #f2f4f8;
				/* Roundness of the border when hovering */
				border-radius: 1px;
			}

			#cpu, #memory, #clock, #battery, #pulseaudio, #network, #workspaces, #tray, #backlight {
				background-color: #161616;
				padding: 3px 10px;
				margin: 3px 0px;
			}

			#tray {
				border-radius: 10px;
				margin-right: 4px;
			}

			#workspaces {
				background-color: #161616;
				border-radius: 0px;
				padding-right: 5px;
			}

			#clock {
				color: #f2f4f8;
				border-radius: 10px;
			}

			#network {
				color: #fab387;
				border-radius: 10px 0px 0px 10px;
			}

			#pulseaudio {
				color: #cac7ff;
			}

			#battery{
				color: #caffbf;
				border-radius: 0 10px 10px 0;
			}

			#backlight{
				color: #9bf6ff;
			}

			#cpu {
				color: #a0c4ff;
			}

			#memory {
				color: #ffc6ff;
			}
			'';
		};
	};
}
