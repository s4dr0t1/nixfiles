/*
	Name: /modules/utilities/librewolf.nix
	Description: Configuration file for librewolf
	Note: To check if Librefox is running properly under Wayland, check about:support and look for Windows Protocol.
*/
{ username, ... }:
{
	home-manager.users.${username}.programs.librewolf = {
		enable = true;
		settings = {
			/* 
				RFP is strongly recommended by Librefox developers: https://librewolf.net/docs/faq/#what-are-the-most-common-downsides-of-rfp-resist-fingerprinting
				But it's just too much for me, the browser becomes literally unusable. So I keep it off and use CanvasBlocker instead: https://librewolf.net/docs/addons/
			*/
			"privacy.resistFingerprinting" = false;

			# Tor anti-fingerprinting technique https://librewolf.net/docs/settings/#enable-letterboxing
			"privacy.resistFingerprinting.letterboxing" = true;

			# Cycle tabs in the recently used order when using CTRL + TAB
			"browser.ctrlTab.sortByRecentlyUsed" = true;

			# Limit cross-origin refers
			"network.http.referer.XOriginPolicy" = 2;

			# What to remember and what not to, upon shutdown of Librefox.
			"privacy.clearOnShutdown.history" = false;
			"privacy.clearOnShutdown.downloads" = false;
			"privacy.clearOnShutdown.cookies" = false;
			"privacy.clearOnShutdown.cache" = false;
			"privacy.clearOnShutdown.formdata" = true;
			"privacy.clearOnShutdown.offlineApps" = true;
			"privacy.clearOnShutdown.openWindows" = true;
			"privacy.clearOnShutdown.siteSettings" = false;
			"privacy.clearOnShutdown.sessions" = false;

			# Don't allow access to camera, notifications and other similar things
			"permissions.default.camera" = 2;
			"permissions.default.desktop-notification" = 2;
			"permissions.default.geo" = 2;
			"permissions.default.microphone" = 2;
			"permissions.default.xr" = 2;

			# Enable HTTPS only mode
			"dom.security.https_only_mode_ever_enabled" = true;
		};
	};
}
