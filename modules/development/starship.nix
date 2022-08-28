{ username, ... }:
{
	home-manager.users.${username}.programs.starship =
	{
		enable = true;
		enableBashIntegration = true;
		enableFishIntegration = true;
		settings = {
			add_newline = true;
			username = {
				show_always = true;
				disabled = false;
				style_root = "bold red";
				style_user = "bold yellow";
				format = "[$user](bold green)[@](bold green)";
			};
			hostname = {
				disabled = false;
				ssh_only = false;
				format = "[$hostname](bold green) in ";
			};
			directory = {
				truncation_length = 5;
				truncate_to_repo = true;
				truncation_symbol = "../";
			};
			battery = {
				disabled = false;
				full_symbol = "🔋";
				charging_symbol = "⚡️";
				discharging_symbol = "💀";
			};
			localip = {
				disabled = false;
				ssh_only = true;
			};
		};
	};
}
