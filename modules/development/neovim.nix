{pkgs, username, ... }:
{
	home-manager.users.${username}.programs.neovim = {
		enable = true;
		extraPackages = with pkgs; [
			fd
			ripgrep
			lua53Packages.luarocks

		];
		extraConfig = "";
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		withNodeJs = true;
		withPython3 = false;
		withRuby = false;
	};
}
