{ config, lib, pkgs, username, ... }:

{
	home-manager.users.${username}= {
		/*
			Write the configuration file named hyprland.conf to ~/.config/hypr
			https://wiki.hyprland.org/Configuring/Basic-Config/
		*/
		home.file = {
		".config/hypr/hyprland.conf".text = ''

		# Additional programs to run on Hyprland startup
		exec-once = ${pkgs.waybar}/bin/waybar

		# Monitor information
		# Use the following command to get information about monitors: hyprctl monitors
		# Entry template: monitor=<monitorName>, <resolution>@<refreshRate>, <offset>, <scaling>
		monitor = eDP-1,1920x1080@60,0x0,1

		general {
			# Used to move/ resize windows. See main_mod + LMB/ RMB
			main_mod = SUPER

			# Size of the border surrounding a Window
			border_size = 1

			# Gaps between Windows and monitor edges
			gaps_in  = 2
			gaps_out = 4

			# Border highlighting of active/ inactive windows
			col.active_border   = 0x80ffffff
			col.inactive_border = 0x66333333

			# DONT CHANGE THIS AT ANY COST
			damage_tracking = full 

			# The layout to use (master/ dwindle)
			layout = dwindle
		}

		decoration {
			# Rounding corner radius
			rounding = 5

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
			sensitivity = 1

			# I don't understand this
			repeat_delay = 250
		}

		input:touchpad {
			disable_while_typing = true
			natural_scroll = false
			tap-to-click = true

		};

		# Every window on a workspace is a member of the binary tree (BSPWM like layout)
		dwindle {
			pseudotile = 0
		}

		# Keybindings
		# Syntax: bind=MOD,key,dispatcher,params
		# Example: bind=SUPERSHIFT,Q,exec,firefox

		bind = SUPER,Return,exec,${pkgs.kitty}/bin/kitty
		bind = SUPER,Q,killactive,
		bind = SUPER,Escape,exit,
		bind = SUPER,E,exec,${pkgs.pcmanfm}/bin/pcmanfm
		bind = SUPER,H,togglefloating,
		bind = SUPER,Space,exec,${pkgs.rofi}/bin/rofi -show drun -o DP-3
		bind = SUPER,P,pseudo,
		bind = SUPER,F,fullscreen,

		bind = SUPER,H,movefocus,l
		bind = SUPER,L,movefocus,r
		bind = SUPER,K,movefocus,u
		bind = SUPER,J,movefocus,d

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
		bind = ALT,right,workspace,+1
		bind = ALT,left,workspace,-1

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
		bind = ALTSHIFT,right,movetoworkspace,+1
		bind = ALTSHIFT,left,movetoworkspace,-1

		bind = CTRL,right,resizeactive,20 0
		bind = CTRL,left,resizeactive,-20 0
		bind = CTRL,up,resizeactive,0 -20
		bind = CTRL,down,resizeactive,0 20

		bind = ,print,exec,${pkgs.flameshot}/bin/flameshot gui

		bind = ,XF86AudioLowerVolume,exec,${pkgs.pamixer}/bin/pamixer -d 10
		bind = ,XF86AudioRaiseVolume,exec,${pkgs.pamixer}/bin/pamixer -i 10
		bind = ,XF86AudioMute,exec,${pkgs.pamixer}/bin/pamixer -t
		bind = ,XF86AudioMicMute,exec,${pkgs.pamixer}/bin/pamixer --default-source -t
		bind = ,XF86MonBrightnessDown,exec,${pkgs.light}/bin/light -U 5
		bind = ,XF86MonBrightnessUP,exec,${pkgs.light}/bin/light -A 5

		windowrule = float,^(Rofi)$
		windowrule = float,title:^(Picture-in-Picture)$
		windowrule = float,title:^(Volume Control)$
		'';
		};
	};
}
