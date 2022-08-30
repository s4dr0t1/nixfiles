/*
	Name: /modules/security/dns.nix
	Description: Contains DNS configuration for my machine
	Link: https://nixos.wiki/wiki/Encrypted_DNS
*/

{ config, lib, pkgs, ... }:
{
	# Disable management of DNS via NetworkManager and override the default DNS to be localhost so that we can use the Encrypted DNS service
	networking = {
		nameservers = [ "127.0.0.1" "::1" ];
		networkmanager.dns = "none";
	};


	services = {
		# Making sure services.resolved is off
		services.resolved.enable = false;

		dnscrypt-proxy2 = {
			enable = true;
			settings = {
				ipv6_servers = true;
				require_dnssec = true;

				sources.public-resolvers = {
					urls = [
						"https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
						"https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
					];
					cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
					minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
				};
				# You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
				# server_names = [ ... ];
			};
		};
	};

	systemd.services.dnscrypt-proxy2.serviceConfig = {
		StateDirectory = "dnscrypt-proxy";
	};
}
