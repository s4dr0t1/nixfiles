{ config, pkgs, inputs, ... }:

{
	home-manager = {
		# Allow unfree packages
		useGlobalPkgs = true;
		useUserPackages = true;

		# Userspace configuration for s4dr0t1
		users.s4dr0t1 = { pkgs, ... }: {
			programs = {
				go = {
					enable = true;
					package = pkgs.go;
					# Programs to add to GOPATH
					packages =
					{
#						"golang.org/x/text" = builtins.fetchGit "https://go.googlesource.com/text";
#						"golang.org/x/time" = builtins.fetchGit "https://go.googlesource.com/time";
					};
				};

				git = {
					enable = true;
					userName  = "Rohit Dhill";
					userEmail = "s4dr0t1@protonmail.com";
				};

				gpg = {
					enable = true;
				};

				tmux = {
					enable = true;
					# Start indexing of windows from 1, and not 0
					baseIndex = 1;
					# Use the 24-hour clock format
					clock24 = false;
					# Set the prefix key
					prefix = "C-a";
					# Store tmux socket under /run instead of /tmp, making it more secure
					secureSocket = true;
					# Set the $TERM environment variable
					terminal = "screen";

					extraConfig =
					''
						# Don't rename windows automatically
						set-option -g allow-rename off

						# Position of the status-line
						set-option -g status-position bottom

						# Making navigation b/w panes easier
						bind h select-pane -L
						bind j select-pane -D
						bind k select-pane -U
						bind l select-pane -R

						# Easier horizontal and vertical splits
						bind-key v split-window -h
						bind-key h split-window -v

						# Status line
						set -g status-justify "left"
						set -g status "on"
						set -g status-style "none,bg=colour234" #b/w left and right
						set -g status-left-style "none"
						set -g status-left-length "100"
						set -g status-left "#[fg=colour247,bg=colour236,bold] #{session_name} #[fg=colour236,bg=colour234,nobold,nounderscore,noitalics]" #session identifier, followed by >
						set -g message-command-style "fg=colour231,bg=colour31"
						set -g pane-active-border-style "fg=colour254"
						set -g message-style "fg=colour231,bg=colour31"
						set -g pane-border-style "fg=colour240"
						set -g status-right-style "none"
						set -g status-right-length "100"
						set -g status-right "#[fg=colour236,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour247,bg=colour236] %Y-%m-%d  %I:%M #[fg=colour252,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour252] #h "
						setw -g window-status-activity-style "none"
						setw -g window-status-separator ""
						setw -g window-status-style "none,fg=colour250,bg=colour234"
						setw -g window-status-format "#[fg=colour244,bg=colour234] #I #[fg=colour250,bg=colour234] #W " #all inactive windows
						setw -g window-status-current-format "#[fg=colour234,bg=colour252,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour252] #I #[fg=colour235,bg=colour252,bold] #W #[fg=colour252,bg=colour234,nobold,nounderscore,noitalics]" #current window
					'';
				};
				

				# Letting home-manager manage itself
				home-manager.enable = true;

				neovim = {
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

				chromium = {
					enable = true;
					package = pkgs.chromium;
					commandLineArgs = [
						# https://github.com/dreammjow/ChromiumHardening/blob/main/flags/chrome-command-line.md
						"--block-new-web-contents"
						"--disable-breakpad"
						"--disable-crash-reporter"
						"--disable-background-networking"
						"--disable-webgl"
						"--dns-prefetch-disable"
						"--no-default-browser-check"
						"--no-displaying-insecure-content"
						"--no-pings"
						"--no-referrers"
						"--ssl-version-min=tls1.2"
						"--disable-translate"
						"--no-proxy-server"
						"--disable-remote-fonts"
						"--disable-preconnect"
						"--disable-reading-from-canva"
						"--disable-default-apps"
						"--mark-non-secure-as"
						"-disable-notifications"
						"--connectivity-check-url=0.0.0.0"
						"--crash-server-url=0.0.0.0"
						"--gaia-url=0.0.0.0"
						"--gcm-checkin-url=0.0.0.0"
						"--gcm-mcs-endpoint=0.0.0.0"
						"--gcm-registration-url=0.0.0.0"
						"--google-apis-url=0.0.0.0"
						"--google-base-url=0.0.0.0"
						"--google-doodle-url=0.0.0.0"
						"--lso-url=0.0.0.0"
						"--oauth-account-manager-url=0.0.0.0"
						"--override-metrics-upload-url=0.0.0.0"
						"--realtime-reporting-url=0.0.0.0"
						"--reporting-connector-url=0.0.0.0"
						"--sync-url=0.0.0.0"
						"--url=0.0.0.0"
						"--variations-server-url=0.0.0.0"
						"--variations-insecure-server-url=0.0.0.0" 
						"--cipher-suite-blacklist='0xc013,0xc014,0x009c,0x009d,0x002f,0x0035'" 
						"--js-flags=--jitless"
						"--isolation-by-default"
						"--blink-settings='dnsPrefetchingEnabled=false,preferredColorScheme=1,strictMixedContentChecking=true,strictMixedContentCheckingForPlugin=true,strictlyBlockBlockableMixedContent=true'"
						"--disable-blink-features='CrossOriginOpenerPolicyReporting,DirectSockets,ExperimentalJSProfiler,GravitySensor,HandwritingRecognition,IdleDetection,PrefersContrast,SignedExchangeSubresourcePrefetch'"
						"--enable-features='BlockInsecurePrivateNetworkRequests,BlockInsecurePrivateNetworkRequestsForNavigations,BrowserDynamicCodeDisabled,DesktopScreenshots,DisableProcessReuse,ElementSuperRareData,EnableCsrssLockdown,EncryptedClientHello,ForceIsolationInfoFrameOriginToTopLevelFrame,GpuAppContainer,ImprovedCookieControls,IntensiveWakeUpThrottling:grace_period_seconds/10,IsolateOrigins,IsolatePrerenders,IsolateSandboxedIframes,MinimizeAudioProcessingForUnusedOutput,NetworkServiceSandbox,NetworkServiceCodeIntegrity,OpaqueResponseBlockingV01,OriginIsolationHeader,PartitionConnectionsByNetworkIsolationKey,PartitionDomainReliabilityByNetworkIsolationKey,PartitionExpectCTStateByNetworkIsolationKey,PartitionHttpServerPropertiesByNetworkIsolationKey,PartitionNelAndReportingByNetworkIsolationKey,PartitionSSLSessionsByNetworkIsolationKey,PartitionedCookies,PostQuantumCECPQ2,PrefetchPrivacyChanges,ReduceUserAgent,ReducedReferrerGranularity,RendererAppContainer,RestrictGamepadAccess,SandboxExternalProtocolBlocked,ScopeMemoryCachePerContext,SplitAuthCacheByNetworkIsolationKey,SplitCacheByIncludeCredentials,SplitCacheByNetworkIsolationKey,SplitHostCacheByNetworkIsolationKey,StrictOriginIsolation,SubframeShutdownDelay,SuppressDifferentOriginSubframeJSDialogs,ThirdPartyStoragePartitioning,ThrottleForegroundTimers,TurnOffStreamingMediaCachingAlways,TurnOffStreamingMediaCachingOnBattery,WinSboxDisableExtensionPoint,WinSboxDisableKtmComponent'"
						"--disable-features='AcceptCHFrame,AdInterestGroupAPI,AllowClientHintsToThirdParty,AllowURNsInIframes,AutofillEnableAccountWalletStorage,AutofillServerCommunication,BrowsingTopics,ClearCrossSiteCrossBrowsingContextGroupWindowName,ClientHintThirdPartyDelegation,ClientHintsDPR,ClientHintsDPR_DEPRECATED,ClientHintsDeviceMemory,ClientHintsDeviceMemory_DEPRECATED,ClientHintsMetaHTTPEquivAcceptCH,ClientHintsMetaNameAcceptCH,ClientHintsResourceWidth,ClientHintsResourceWidth_DEPRECATED,ClientHintsViewportWidth,ClientHintsViewportWidth_DEPRECATED,ComputePressure,ContextMenuPerformanceInfoAndRemoteHintFetching,ConversionMeasurement,CookieDomainRejectNonASCII,CopyLinkToText,CrashReporting,CriticalClientHint,CrostiniAdditionalEnterpriseReporting,CssSelectorFragmentAnchor,DocumentReporting,EnableStructuredMetrics,EnterpriseRealtimeExtensionRequest,ExpectCTReporting,EnableTLS13EarlyData,FedCm,Fledge,FontAccess,GreaseUACH,IdleDetection,InterestGroupStorage,Journeys,LensStandalone,MediaDrmPreprovisioning,MediaEngagementBypassAutoplayPolicies,NavigationRequestPreconnect,NetworkTimeServiceQuerying,NotificationTriggers,OmniboxTriggerForNoStatePrefetch,OptimizationHints,OptimizationHintsFetching,OptimizationHintsFetchingAnonymousDataConsent,OptimizationHintsFieldTrials,Parakeet,Prerender2,PrefersColorSchemeClientHintHeader,PreloadMediaEngagementData,Reporting,RetailCoupons,SCTAuditing,SegmentationPlatform,SignedExchangeReportingForDistributors,SignedHTTPExchange,SpeculationRulesPrefetchProxy,SubresourceWebBundles,TabMetricsLogging,TFLiteLanguageDetectionEnabled,TextFragmentAnchor,SafeBrowsingBetterTelemetryAcrossReports,UserAgentClientHint,UserAgentClientHintFullVersionList,UsernameFirstFlow,UsernameFirstFlowFilling,UsernameFirstFlowFallbackCrowdsourcing,ViewportHeightClientHintHeader,WebNFC,WebOTP,WebSQLInThirdPartyContextEnabled,WebXR,WinrtGeolocationImplementation'"
					];
					extensions = [
						# Ublock Origin
						{ id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
						# DDG Privacy Essentials
						{ id = "bkdgflcldnnnapblkhphbgpggdiikppg"; }
						# LocalCDN
						{ id = "njdfdhgcmkocbgbhcioffdbicglldapd"; }
						# Plasma Integration
						{ id = "cimiefiiaegbelhefglklhhakcgmhkai"; }
						# DarkReader
						{ id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }
						# Enhancer for YouTube
						{ id = "ponfpcnoihfmfllpaingbgckeeldkhle"; }
						# XDM
						{ id = "dkckaoghoiffdbomfbbodbbgmhjblecj"; }
					];
				};
			};
			home = {
				sessionVariables = {
					EDITOR = "nvim";
					VISUAL = "nvim";
				};
				stateVersion = "22.05";
				username = "s4dr0t1";
				homeDirectory = "/home/s4dr0t1";

				packages = with pkgs; [ 
					# Command line applications
					kitty
					bat
					starship
					chezmoi
					patchelf
					nerdfonts

					# Appearance
					la-capitaine-icon-theme
					whitesur-gtk-theme

					# Productivity applications
					calibre
					flameshot
					notion-app-enhanced
					obsidian
					obs-studio
					vmware-workstation
					openboard
					libreoffice

					# Security applications
					checksec
					tailscale
					wireshark
					rappel

					# Recreation, social media and messaging
					discord
					jellyfin-media-player
					vlc
					tdesktop

					# Programming
					rustup
					vscodium
					];
				};
		};
	};

}
