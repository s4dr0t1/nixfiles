{
	description = "s4dr0t1's system configuration";

	# Dependencies, similar to nix-channels
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-22.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	# Function which tells my flake with to do with the dependencies
	outputs = inputs @ { nixpkgs, home-manager, ... }: 
		let
			username = "s4dr0t1";
			hostname = "ucciha";
			system = "x86_64-linux";
		in
		{
			nixosConfigurations = {
				${hostname} = nixpkgs.lib.nixosSystem {
					inherit system;
					modules = [
							(import ./nixfiles/system/configuration.nix)
							(import ./nixfiles/system/hardware-configuration.nix)

							(import ./nixfiles/user-configuration/home-manager.nix)
							home-manager.nixosModules.home-manager
							#{
							#	home-manager.useGlobalPkgs = true;
							#	home-manager.useUserPackages = true;
							#}

#						{
#							nixpkgs.overlays = 
#							let
#								discordOverlay = self: super: { discord = super.discord.override { withOpenASAR = true; }; };
#							in
#							[ discordOverlay ];
#
#						}
					];
					specialArgs = { inherit inputs; };
				};
			};

			${hostname} = inputs.self.nixosConfigurations.${hostname}.config.system.system.build.toplevel;
		};
}
