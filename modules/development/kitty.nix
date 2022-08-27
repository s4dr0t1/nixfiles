{username, ... }:
{
	home-manager.users.${username}.programs.kitty = {
		enable = true;
		environment = { 
			"EDITOR" = "nvim";
			"VISUAL" = "nvim";
		};
		/*
			{
				enable_audio_bell = false;
				scrollback_lines = 10000;
				update_check_interval = 0;
			}
		*/
		settings = {
			# Font configuration
			font_family = "MesloLGS Nerd Font";
			bold_font = "auto";
			italic_font = "auto";
			bold_italic_font = "auto";
			font_size = 15;

			# Miscellaneous
			remember_window_size = "yes";
			allow_remote_control  = "no";
		};
		extraConfig =
		''
		## Theme name: carbonfox
		## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/nightfox_kitty.conf

		background #161616
		foreground #f2f4f8
		selection_background #2a2a2a
		selection_foreground #f2f4f8
		url_color #25be6a

		# Cursor
		# uncomment for reverse background
		# cursor none
		cursor #f2f4f8

		# Border
		active_border_color #78a9ff
		inactive_border_color #535353
		bell_border_color #3ddbd9

		# Tabs
		active_tab_background #78a9ff
		active_tab_foreground #0c0c0c
		inactive_tab_background #2a2a2a
		inactive_tab_foreground #6e6f70

		# normal
		color0 #282828
		color1 #ee5396
		color2 #25be6a
		color3 #08bdba
		color4 #78a9ff
		color5 #be95ff
		color6 #33b1ff
		color7 #dfdfe0

		# bright
		color8 #484848
		color9 #f16da6
		color10 #46c880
		color11 #2dc7c4
		color12 #8cb6ff
		color13 #c8a5ff
		color14 #52bdff
		color15 #e4e4e5

		# extended colors
		color16 #3ddbd9
		color17 #ff7eb6
		'';
	};
}
