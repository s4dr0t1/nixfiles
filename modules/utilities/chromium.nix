/*
	Name: /modules/utilities/chromium.nix
	Description: Configuration for the Chromium web browser, managed through home-manager
*/
{ pkgs, username, ... }:
{
	home-manager.users.${username}.programs.chromium = {
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
			# DarkReader
			{ id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }
			# Enhancer for YouTube
			{ id = "ponfpcnoihfmfllpaingbgckeeldkhle"; }
		];
	};
}
