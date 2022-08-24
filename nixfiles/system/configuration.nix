{ config, pkgs, inputs, ... }:

let
	config = config.nixpkgs.config;
in
{
	nix = {
		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
		};
	};

	# Bootloader.
	boot.loader = {
		systemd-boot = {
			enable = true;
			configurationLimit = 10;
		};
		efi.canTouchEfiVariables = true;
		efi.efiSysMountPoint = "/boot/efi";
	};

	networking.hostName = "ucciha"; # Define your hostname.
	networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant, and let network-manager handle it all.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Asia/Kolkata";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_IN.utf8";

	services = {
		# Enable or disable printing using CUPS
		printing.enable = false;

		xserver = {
			# Enable or disable the X-server
			enable = true;

			libinput = {
				enable = true;
				# Enable or disable tapping via your laptop's touchpad
				touchpad = {
					tapping = true;
					scrollMethod = "twofinger";
				};
			};

			# Configure keymap in X11
			layout = "us";
			xkbVariant = "";


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



	# Enable sound with pipewire.
	sound.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	# If you want to use JACK applications, uncomment this
	#jack.enable = true;

	# use the example session manager (no others are packaged yet so this is enabled by default,
	# no need to redefine it in your config for now)
	#media-session.enable = true;
  };


	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.s4dr0t1 = {
		isNormalUser = true;
		description = "Rohit Dhill";
		initialPassword = "password"; #CHANGE THIS LATER USING passwd
		extraGroups = [ "networkmanager" "wheel" "wireshark" "docker"];
		shell = pkgs.fish;
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment = {
		systemPackages = with pkgs; [
			wget
			curl
			alacritty
			git
			file
			binutils
			gcc
			gnumake
			cmake
			coreutils-full
			ltrace
			unzip
			librewolf
			unzip
			xxd

			gnupg
			libsForQt5.kleopatra
			git-crypt
			pinentry-qt

			kde-gtk-config
		];
	};

	# Home-manager configuration
	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	programs = {
		gnupg.agent = {
			enable = true;
			enableSSHSupport = true;
		};
	};

	# Virtualisation options
	virtualisation = {
		docker = {
			enable = true;
			autoPrune.enable = true;
		};

	};

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "22.05"; # Did you read the comment?

}
