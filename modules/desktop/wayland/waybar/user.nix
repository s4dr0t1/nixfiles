{ username, ...}:
{
	home-manager.users.${username}.programs.waybar = {
		enable = true;
	};
}
