/*
	Name: /overlays/default.nix
	Description: Acts as a pointer to other overlays
*/
{
	imports = [
		(./neovim.nix)
	];
}
