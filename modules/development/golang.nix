{username, ... }:
{
	home-manager.users.${username}.programs.go = {
		enable = true;
	};
}
