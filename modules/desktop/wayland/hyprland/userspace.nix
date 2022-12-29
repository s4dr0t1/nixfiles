/*
	Name: /modules/desktop/wayland/hyprland/userspace.nix
	Description: Userspace configuration file for Hyprland
*/
{ config, lib, pkgs, username, ... }:

{
	home-manager.users.${username}= {

		/*
			Start Hyprland on first login through TTY
			This is a fish script, you may need to convert it into your shell equivalent
		*/
		programs.fish.loginShellInit =
		''
			if [ -z $DISPLAY ] && [ (tty) = "/dev/tty1" ];
				exec Hyprland
			end
		'';

		/*
			Write the configuration file named hyprland.conf to ~/.config/hypr
			https://wiki.hyprland.org/Configuring/Basic-Config/
		*/
		home.file = {
		".config/hypr/hyprland.conf".text = ''

		# Additional programs to run on Hyprland startup
		exec-once = ${pkgs.waybar}/bin/waybar
		exec-once = ${pkgs.swaybg}/bin/swaybg -i $HOME/Pictures/wallpaper -m fit

		# Monitor information
		# Use the following command to get information about monitors: hyprctl monitors
		# Entry template: monitor=<monitorName>, <resolution>@<refreshRate>, <offset>, <scaling>

		monitor = eDP-1,1920x1080@60,0x0,1

		general {
			# Used to move/ resize windows. See main_mod + LMB/ RMB
			main_mod = SUPER

			# Size of the border surrounding a Window
			border_size = 1

			# Disable boders for floating windows
			no_border_on_floating = false

			# Gaps between Windows and monitor edges
			gaps_in  = 2
			gaps_out = 4

			# Border highlighting of active/ inactive windows
			col.active_border   = 0x80ffffff
			col.inactive_border = 0x161616

			# Hide the cursor after this defined time period
			cursor_inactive_timeout = 10

			# The layout to use (master/ dwindle)
			layout = dwindle
		}

		decoration {
			# Rounding corner radius
			rounding = 0

			# I don't understand this
			multisample_edges = true

			# Opacity effect for active/ inactive Windows
			active_opacity     = 1
			inactive_opacity   = 1
			fullscreen_opacity = 1

			# Disable blur effect
			blur = false

			# Enable drop shadow on Windows
			drop_shadow = false
		}

		animations {
			enabled = true
		}

		input {
			# Keyboard layout to follow
			kb_layout = us

			# Numlock should be ON by default
			numlock_by_default = 1

			# Reverse scrolling
			natural_scroll = false

			# Disable mouse support for Hyprland
			follow_mouse = 0

			# Libinput mouse sensitivity (-1 to 1)
			sensitivity = 0.8

			# I don't understand this
			repeat_delay = 250

			touchpad {
				disable_while_typing = true
				natural_scroll = false
				tap-to-click = false
			};
		}


		# Keybindings to perform certain tasks
		# Syntax: bind=MOD,key,dispatcher,params
		# Example: bind=SUPERSHIFT,Q,exec,firefox

		# Opening certain applications
		bind = SUPER,Return,exec,${pkgs.kitty}/bin/kitty
		bind = SUPER,Space,exec,${pkgs.rofi-wayland}/bin/rofi -show drun
		bind = SUPER,c,exec,${pkgs.chromium}/bin/chromium
		bind = SUPER,E,exec,${pkgs.pcmanfm}/bin/pcmanfm
		bind = ALTSHIFT,L,exec,${pkgs.swaylock-effects}/bin/swaylock

		# Kill Hyprland and go back to tty
		bind = SUPER,Escape,exit,

		# Kill the current active screen
		bind = SUPER,Q,killactive,

		# pseudo window
		bind = SUPER,P,pseudo,

		# Full-screen the current window
		bind = SUPER,F,fullscreen,

		# Move focus b/w windows
		bind = SUPER,H,movefocus,l
		bind = SUPER,L,movefocus,r
		bind = SUPER,K,movefocus,u
		bind = SUPER,J,movefocus,d

		# Move to a specific workspace
		bind = ALT,1,workspace,1
		bind = ALT,2,workspace,2
		bind = ALT,3,workspace,3
		bind = ALT,4,workspace,4
		bind = ALT,5,workspace,5
		bind = ALT,6,workspace,6
		bind = ALT,7,workspace,7
		bind = ALT,8,workspace,8
		bind = ALT,9,workspace,9
		bind = ALT,0,workspace,10
		bind = ALT,L,workspace,+1
		bind = ALT,H,workspace,-1

		# Move the current active window to the specific workspace
		bind = ALTSHIFT,1,movetoworkspace,1
		bind = ALTSHIFT,2,movetoworkspace,2
		bind = ALTSHIFT,3,movetoworkspace,3
		bind = ALTSHIFT,4,movetoworkspace,4
		bind = ALTSHIFT,5,movetoworkspace,5
		bind = ALTSHIFT,6,movetoworkspace,6
		bind = ALTSHIFT,7,movetoworkspace,7
		bind = ALTSHIFT,8,movetoworkspace,8
		bind = ALTSHIFT,9,movetoworkspace,9
		bind = ALTSHIFT,0,movetoworkspace,10
		bind = ALTSHIFT,L,movetoworkspace,+1
		bind = ALTSHIFT,H,movetoworkspace,-1

		# Resize windows
		bind = CTRL,right,resizeactive,20 0
		bind = CTRL,left,resizeactive,-20 0
		bind = CTRL,up,resizeactive,0 -20
		bind = CTRL,down,resizeactive,0 20

		# New syntax for mouse binds (https://github.com/hyprwm/Hyprland/issues/688)
		bindm=SUPER,mouse:272,movewindow
		bindm=SUPER,mouse:273,resizewindow

		# Windows movement
		bind = SUPERSHIFT,h,movewindow,l
		bind = SUPERSHIFT,l,movewindow,r
		bind = SUPERSHIFT,j,movewindow,u
		bind = SUPERSHIFT,k,movewindow,d


		# Keyboard shortcuts to increase/ decrease volume, brightness etc
		bind = ,XF86AudioLowerVolume,exec,${pkgs.pamixer}/bin/pamixer -d 10
		bind = ,XF86AudioRaiseVolume,exec,${pkgs.pamixer}/bin/pamixer -i 10
		bind = ,XF86AudioMute,exec,${pkgs.pamixer}/bin/pamixer -t
		bind = ,XF86AudioMicMute,exec,${pkgs.pamixer}/bin/pamixer --default-source -t

		bind = ,XF86MonBrightnessUP,exec,${pkgs.brightnessctl}/bin/brightnessctl s 5%+
		bind = ,XF86MonBrightnessDown,exec,${pkgs.brightnessctl}/bin/brightnessctl s 5%-

		windowrule = float,^(Rofi)$
		windowrule = float,title:^(Picture-in-Picture)$
		windowrule = float,title:^(Volume Control)$
		'';
		};
	};
}
