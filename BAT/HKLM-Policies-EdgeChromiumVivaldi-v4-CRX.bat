@echo off
@title Policies tweaker for MS Edge and Chromium + CRX ^| ver. 4.0 ^| 15.09.2024
@pause

:: Get more: https://learn.microsoft.com/en-us/deployedge/microsoft-edge-policies

::EDGE
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BrowserAddProfileEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BrowserGuestModeEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiskCacheDir" /t REG_SZ /d "nul" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiskCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeCollectionsEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageAllowedBackgroundTypes" /t REG_DWORD /d "3" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageQuickLinksEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PromotionalTabsEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowRecommendationsEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /t REG_DWORD /d "0" /f
::EDGE 2024
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d "2" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BrowserSignin" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "CryptoWalletEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EnableMediaRouter" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "MicrosoftEdgeInsiderPromotionEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NetworkPredictionOptions" /t REG_DWORD /d "2" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PaymentMethodQueryEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SearchInSidebarEnabled" /t REG_DWORD /d "2" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SyncDisabled" /t REG_DWORD /d "1" /f
::EDGE 2024 +
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AutoImportAtFirstRun" /t REG_DWORD /d "4" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d "1" /f
::EDGE 2024 ++
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ExtensionManifestV2Availability" /t REG_DWORD /d "2" /f

::EDGE(obsolete) :: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultBrowserSettingEnabled" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HardwareAccelerationModeEnabled" /t REG_DWORD /d "1" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowPDFDefaultRecommendationsEnabled" /t REG_DWORD /d "0" /f

::EDGE for User = no Private
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "InPrivateModeAvailability" /t REG_DWORD /d "1" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AllowDeletingBrowserHistory" /t REG_DWORD /d "0" /f

:: Get more: https://chromeenterprise.google/policies/

::Chromium
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "BrowserAddProfileEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "BrowserGuestModeEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "ComponentUpdatesEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "DefaultBrowserSettingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "DiskCacheDir" /t REG_SZ /d "nul" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "DiskCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "MediaCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "UserDataDir" /t REG_SZ /d "UserData" /f
::Chromium 2024++
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "ExtensionManifestV2Availability" /t REG_DWORD /d "2" /f

::Chrome
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "BrowserAddProfileEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "BrowserGuestModeEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ComponentUpdatesEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "DefaultBrowserSettingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "DiskCacheDir" /t REG_SZ /d "nul" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "DiskCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "MediaCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "UserDataDir" /t REG_SZ /d "UserData" /f
::Chrome 2024++
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ExtensionManifestV2Availability" /t REG_DWORD /d "2" /f

::Chromium for User = no Private
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "AllowDeletingBrowserHistory" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "IncognitoEnabled" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "IncognitoModeAvailability" /t REG_DWORD /d "1" /f

::Chrome for User = no Private
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "AllowDeletingBrowserHistory" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "IncognitoEnabled" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "IncognitoModeAvailability" /t REG_DWORD /d "1" /f

::Chromium CRX
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /v "1" /t REG_SZ /d "cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx" /f	&ECHO uBlock Origin		&ECHO https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /v "2" /t REG_SZ /d "doojmbjmlfjjnbmnoijecmcbfeoakpjm;https://clients2.google.com/service/update2/crx" /f	&ECHO NoScript			&ECHO https://chromewebstore.google.com/detail/noscript/doojmbjmlfjjnbmnoijecmcbfeoakpjm
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /v "3" /t REG_SZ /d "omkfmpieigblcllmkgbflkikinpkodlk;https://clients2.google.com/service/update2/crx" /f	&ECHO enhanced-h264ify 		&ECHO https://chromewebstore.google.com/detail/enhanced-h264ify/omkfmpieigblcllmkgbflkikinpkodlk
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /v "4" /t REG_SZ /d "hmbmmdjlcdediglgfcdkhinjdelkiock;https://clients2.google.com/service/update2/crx" /f	&ECHO Font Rendering Enhancer 	&ECHO https://chromewebstore.google.com/detail/font-rendering-enhancer/hmbmmdjlcdediglgfcdkhinjdelkiock
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /v "5" /t REG_SZ /d "ddkjiahejlhfcafbddmgiahcphecmpfh;https://clients2.google.com/service/update2/crx" /f	&ECHO uBlock Origin Lite	&ECHO https://chromewebstore.google.com/detail/ddkjiahejlhfcafbddmgiahcphecmpfh

::Chrome CRX
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "1" /t REG_SZ /d "cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx" /f	&ECHO uBlock Origin		&ECHO https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "2" /t REG_SZ /d "doojmbjmlfjjnbmnoijecmcbfeoakpjm;https://clients2.google.com/service/update2/crx" /f	&ECHO NoScript			&ECHO https://chromewebstore.google.com/detail/noscript/doojmbjmlfjjnbmnoijecmcbfeoakpjm
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "3" /t REG_SZ /d "omkfmpieigblcllmkgbflkikinpkodlk;https://clients2.google.com/service/update2/crx" /f	&ECHO enhanced-h264ify 		&ECHO https://chromewebstore.google.com/detail/enhanced-h264ify/omkfmpieigblcllmkgbflkikinpkodlk
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "4" /t REG_SZ /d "hmbmmdjlcdediglgfcdkhinjdelkiock;https://clients2.google.com/service/update2/crx" /f	&ECHO Font Rendering Enhancer 	&ECHO https://chromewebstore.google.com/detail/font-rendering-enhancer/hmbmmdjlcdediglgfcdkhinjdelkiock
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "5" /t REG_SZ /d "ddkjiahejlhfcafbddmgiahcphecmpfh;https://clients2.google.com/service/update2/crx" /f	&ECHO uBlock Origin Lite	&ECHO https://chromewebstore.google.com/detail/ddkjiahejlhfcafbddmgiahcphecmpfh

::Vivaldi
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "BrowserAddProfileEnabled" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "BrowserGuestModeEnabled" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "ComponentUpdatesEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "DefaultBrowserSettingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "DiskCacheDir" /t REG_SZ /d "nul" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "DiskCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "MediaCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "UserDataDir" /t REG_SZ /d "UserData" /f
::Vivaldi 2024++
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Vivaldi" /v "ExtensionManifestV2Availability" /t REG_DWORD /d "2" /f

@pause