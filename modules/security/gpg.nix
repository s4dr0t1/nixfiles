{username, ... }:
{
	home-manager.users.${username}.programs.gpg = {
		enable = true;
	};
}
