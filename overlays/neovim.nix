/*
	Name: /overlays/neovim.nix
	Description: Overlay to keep my neovim build bleeding edge
*/

{ inputs, pkgs, ...}:
{
	nixpkgs.overlays = [
		inputs.neovim-nightly-overlay.overlay
	];
}
