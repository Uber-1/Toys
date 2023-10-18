@echo off
@title Policies tweaker for MS Edge and Chromium + CRX ^| ver. 3.3 ^| 13.06.2023
@pause

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

::EDGE TEST
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d "2" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d "1" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowPDFDefaultRecommendationsEnabled" /t REG_DWORD /d "0" /f

::EDGE for User
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "InPrivateModeAvailability" /t REG_DWORD /d "1" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AllowDeletingBrowserHistory" /t REG_DWORD /d "0" /f

::Chromium
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "BrowserAddProfileEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "BrowserGuestModeEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "ComponentUpdatesEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "DefaultBrowserSettingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "DiskCacheDir" /t REG_SZ /d "nul" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "DiskCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "MediaCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "UserDataDir" /t REG_SZ /d "UserData" /f

::Chrome
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "BrowserAddProfileEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "BrowserGuestModeEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ComponentUpdatesEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "DefaultBrowserSettingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "DiskCacheDir" /t REG_SZ /d "nul" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "DiskCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "MediaCacheSize" /t REG_DWORD /d "1" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "UserDataDir" /t REG_SZ /d "UserData" /f

::Chromium for User
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "AllowDeletingBrowserHistory" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "IncognitoEnabled" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium" /v "IncognitoModeAvailability" /t REG_DWORD /d "1" /f

::Chrome for User
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "AllowDeletingBrowserHistory" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "IncognitoEnabled" /t REG_DWORD /d "0" /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "IncognitoModeAvailability" /t REG_DWORD /d "1" /f

::Chromium CRX
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /v "1" /t REG_SZ /d "cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx" /f	&ECHO uBlock Origin		&ECHO https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /v "2" /t REG_SZ /d "doojmbjmlfjjnbmnoijecmcbfeoakpjm;https://clients2.google.com/service/update2/crx" /f	&ECHO NoScript			&ECHO https://chrome.google.com/webstore/detail/noscript/doojmbjmlfjjnbmnoijecmcbfeoakpjm
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /v "3" /t REG_SZ /d "omkfmpieigblcllmkgbflkikinpkodlk;https://clients2.google.com/service/update2/crx" /f	&ECHO enhanced-h264ify 		&ECHO https://chrome.google.com/webstore/detail/enhanced-h264ify/omkfmpieigblcllmkgbflkikinpkodlk
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Chromium\ExtensionInstallForcelist" /v "4" /t REG_SZ /d "hmbmmdjlcdediglgfcdkhinjdelkiock;https://clients2.google.com/service/update2/crx" /f	&ECHO Font Rendering Enhancer 	&ECHO https://chrome.google.com/webstore/detail/font-rendering-enhancer/hmbmmdjlcdediglgfcdkhinjdelkiock

::Chrome CRX
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "1" /t REG_SZ /d "cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx" /f	&ECHO uBlock Origin		&ECHO https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "2" /t REG_SZ /d "doojmbjmlfjjnbmnoijecmcbfeoakpjm;https://clients2.google.com/service/update2/crx" /f	&ECHO NoScript			&ECHO https://chrome.google.com/webstore/detail/noscript/doojmbjmlfjjnbmnoijecmcbfeoakpjm
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "3" /t REG_SZ /d "omkfmpieigblcllmkgbflkikinpkodlk;https://clients2.google.com/service/update2/crx" /f	&ECHO enhanced-h264ify 		&ECHO https://chrome.google.com/webstore/detail/enhanced-h264ify/omkfmpieigblcllmkgbflkikinpkodlk
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v "4" /t REG_SZ /d "hmbmmdjlcdediglgfcdkhinjdelkiock;https://clients2.google.com/service/update2/crx" /f	&ECHO Font Rendering Enhancer 	&ECHO https://chrome.google.com/webstore/detail/font-rendering-enhancer/hmbmmdjlcdediglgfcdkhinjdelkiock

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

@pause