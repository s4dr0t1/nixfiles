#DON't MODIFY THIS FILE

{ config, lib, pkgs, modulesPath, username, ... }:

{
	imports = [ 
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot = {
		initrd = {
			availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" ];
			kernelModules = [ ];
		};
		kernelModules = [ "kvm-intel" ];
		extraModulePackages = [ ];
	};

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/39599ce2-ed49-4e3d-8f01-c7d1b5f0176a";
		fsType = "ext4";
	};

	fileSystems."/boot/efi" =
	{
		device = "/dev/disk/by-uuid/2F24-1C84";
		fsType = "vfat";
	};

	fileSystems."/home/${username}/media" =
	{
		device = "/dev/disk/by-uuid/93fbb804-57a2-4982-a91c-b7bc266fdb89";
		fsType = "ext4";
	};

	swapDevices =
	[ 
		{ 
			device = "/dev/disk/by-uuid/fd2d1d46-06db-46dd-8ee4-7759768b9ddb"; 
		}
	];

	powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

	hardware = {
		cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
		bluetooth.enable = false;
	};
}
