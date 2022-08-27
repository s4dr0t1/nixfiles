{fullname, useremail, username, ... }:
{
	home-manager.users.${username}.programs.git = {
		enable = true;
		userName  = "${fullname}";
		userEmail = "${useremail}";
	};
}
