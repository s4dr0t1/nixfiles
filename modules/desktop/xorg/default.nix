/*
	Name: /modules/desktop/xorg/default.nix
	Description: Points to other files related to configuration related to the Xorg display server protocol
*/
{
	imports = [
		# System level configuration related to the Xorg project
		./system.nix
	];
}
