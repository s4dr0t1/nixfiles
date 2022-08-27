/*
	Name: configuration.nix
	Description: User agnostic system-wide configuration file
	Contains configuration options for the following:
		- Nix package manager
		- Bootloader options
		- User accounts
		- Networking
		- Time zone and internationalization properties
		- Sound
		- Fonts
		- Virtualisation
		- Display
		- System-wide packages
		- Miscellaneous
*/

{ config, lib, pkgs, inputs, username, useremail, fullname,  ... }:
{
	/*
		Nix settings
	*/

	# Allow installation of unfree packages
	nixpkgs.config.allowUnfree = true;

	nix = {
		settings = {
			# Save space with hard linking
			auto-optimise-store = true;

			# Enable support for flakes
			experimental-features = [ "nix-command" "flakes" ];
		};

		# Automatic garbage collection
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};
	};

	/*
		Bootloader options
	*/
	boot.loader = {
		systemd-boot = {
			enable = true;
			configurationLimit = 10;
		};
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot/efi";
		};
	};

	/*
		User account configuration
	*/
	users.users.${username} = {
		isNormalUser = true;
		description = "Rohit Dhill";
		initialPassword = "password"; #CHANGE THIS LATER USING passwd
		shell = pkgs.fish;
		extraGroups = [
			"networkmanager"
			"wheel"
			"wireshark"
			"docker"
		];
	};

	/*
		Networking
	*/
	networking = {
		hostName = "ucciha";

		# DNS servers
		nameservers = [
			"1.1.1.1"
			"1.0.0.1"
		];

		useDHCP = lib.mkDefault true;

		# Let computer networking be managed by NetworkManager
		networkmanager.enable = true;

		# Disable wireless management wpa_supplicant and let Networkmanager handle it
		wireless.enable = false;
	};

	/*
		Time zone and internationalization information
	*/
	time.timeZone = "Asia/Kolkata";
	i18n.defaultLocale = "en_IN.utf8";

	/*
		Sound options
	*/

	# Enable pipewire
	sound.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa = {
			enable = true;
			support32Bit = true;
		};
		pulse.enable = true;
	};

	/*
		Fonts
	*/
	fonts.fonts = with pkgs; [
		(nerdfonts.override {
			fonts = [
				"Meslo"
			];
		})
	];

	/*
		Virtualisation options
	*/
	virtualisation = {
		docker = {
			enable = true;
			autoPrune.enable = true;
		};

	};

	/*
		Display options
	*/
	services = {
		xserver = {
			enable = true;

			libinput = {
				enable = true;
				touchpad = {
					tapping = true;
					scrollMethod = "twofinger";
				};
			};

			layout = "us";

			displayManager = {
				sddm = {
					enable = true;
				};
			};

			desktopManager = {
				plasma5 = {
					enable = true;
				};
			};
		};
	};

	/*
		System wide package configuration
	*/
	environment = {
		systemPackages = with pkgs; [
			# Programming
			binutils
			gcc
			gnumake
			cmake
			coreutils-full
			ltrace
			strace

			# Essentials
			git
			curl
			unzip
			file

			# Web browsers
			librewolf
		];
	};

	programs = {
		# Android debug bridge
		adb.enable = true;

		# GPG
		gnupg = {
			agent = {
				enable = true;
				pinentryFlavor = "qt";
			};
		};
	};

	/*
		Miscellaneous
	*/
	services.printing.enable = true;
	system.stateVersion = "22.05"; #Don't change this at any cost
}
