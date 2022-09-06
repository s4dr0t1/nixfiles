/*
	Name: /modules/security/gpg.nix
	Description: Contains gpg configuration for my user
	Link: https://nixos.wiki/wiki/Encrypted_DNS
*/

{ username, ... }:
{
	home-manager.users.${username}.programs.gpg = {
		enable = true;
	};
}
