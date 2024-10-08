@echo off
@title r3dfox Portable Creator - ver.4.7.1 [08.10.2024]
@cd /d "%~dp0"

@if not exist "curl.exe" (@if not exist "%SystemRoot%\SYSTEM32\curl.exe" (
@echo Checking version with powershell . . .
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Eclipse-Community/r3dfox/releases/latest', 'latest')"
)) else (
@echo Checking version with CURL . . .
@curl.exe -RL# "https://github.com/Eclipse-Community/r3dfox/releases/latest" -o "latest"
)

@for /f "eol=- tokens=1-26 delims=v " %%a in ('@type "latest" ^| @FINDSTR /IRC:"title.*.Release.v.*.r3dfox"') do (@if NOT DEFINED r3dfoxLatest (@set r3dfoxLatest=%%c))
@echo r3dfox Latest Version: [%r3dfoxLatest%]
@del "latest" /q

@if exist "curl.exe" @GOTO CURLDL
@if exist "%SystemRoot%\SYSTEM32\curl.exe" @GOTO CURLDL
@echo Downloading with powershell . . .
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Eclipse-Community/r3dfox/releases/download/%r3dfoxLatest%/r3dfox-%r3dfoxLatest%.en-US.win32.installer.exe', 'r3dfwin.exec')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.7-zip.org/a/7zr.exe', '7zr.exe')"
@GOTO MAKECONFIG
:CURLDL
@echo Downloading with CURL . . .
@curl.exe -RL# "https://github.com/Eclipse-Community/r3dfox/releases/download/%r3dfoxLatest%/r3dfox-%r3dfoxLatest%.en-US.win32.installer.exe" -o "r3dfwin.exec"
@curl.exe -RLO# "https://www.7-zip.org/a/7zr.exe"
:MAKECONFIG

@md "r3dfoxPortable\core\defaults\pref"
@md "r3dfoxPortable\core\distribution"
@"7zr.exe" x -t7z -bso0 "r3dfwin.exec" -o"r3dfoxPortable" -xr!setup.exe -xr!*crashreporter* -xr!*default*agent* -xr!maintenanceservice*.exe -xr!minidump-analyzer.exe -xr!updater* -xr!uninstall
@del "7zr.exe" "r3dfwin.exec" /q

(
@echo // Mozilla User Preferences
@echo+
@echo defaultPref^("accessibility.blockautorefresh", true^);
@echo defaultPref^("accessibility.handler.enabled", false^);
@echo defaultPref^("accessibility.typeaheadfind", true^);
@echo defaultPref^("accessibility.typeaheadfind.flashBar", 0^);
@echo defaultPref^("alerts.disableSlidingEffect", true^);
@echo defaultPref^("app.normandy.api_url", ""^);
@echo defaultPref^("app.normandy.enabled", false^);
@echo defaultPref^("app.normandy.first_run", false^);
@echo defaultPref^("app.shield.optoutstudies.enabled", false^);
@echo defaultPref^("app.support.e10sAccessibilityUrl", ""^);
@echo defaultPref^("app.update.auto", false^);
@echo defaultPref^("app.update.checkInstallTime", false^);
@echo defaultPref^("app.update.disable_button.showUpdateHistory", false^);
@echo defaultPref^("app.update.enabled", false^);
@echo defaultPref^("app.update.migrated.updateDir", true^);
@echo defaultPref^("app.update.service.enabled", false^);
@echo defaultPref^("app.update.url", ""^);
@echo defaultPref^("app.update.url.details", ""^);
@echo defaultPref^("app.update.url.manual", ""^);
@echo defaultPref^("beacon.enabled", false^);
@echo defaultPref^("breakpad.reportURL", ""^);
@echo defaultPref^("browser.aboutConfig.showWarning", false^);
@echo defaultPref^("browser.aboutHomeSnippets.updateUrl", ""^);
@echo defaultPref^("browser.bookmarks.restore_default_bookmarks", false^);
@echo defaultPref^("browser.bookmarks.showRecentlyBookmarked", false^);
@echo defaultPref^("browser.cache.disk.capacity", 0^);
@echo defaultPref^("browser.cache.disk.enable", false^);
@echo defaultPref^("browser.cache.disk.smart_size.enabled", false^);
@echo defaultPref^("browser.cache.disk.smart_size.first_run", false^);
@echo defaultPref^("browser.cache.disk_cache_ssl", false^);
@echo defaultPref^("browser.cache.memory.capacity", -1^);
@echo defaultPref^("browser.cache.offline.enable", false^);
@echo defaultPref^("browser.cache.offline.insecure.enable", false^);
@echo defaultPref^("browser.cache.offline.storage.enable", false^);
@echo defaultPref^("browser.chrome.errorReporter.enabled", false^);
@echo defaultPref^("browser.chrome.errorReporter.infoURL", ""^);
@echo defaultPref^("browser.chrome.errorReporter.submitUrl", ""^);
@echo defaultPref^("browser.contentblocking.report.endpoint_url", ""^);
@echo defaultPref^("browser.ctrlTab.recentlyUsedOrder", false^);
@echo defaultPref^("browser.customizemode.tip0.shown", true^);
@echo defaultPref^("browser.defaultbrowser.notificationbar", false^);
@echo defaultPref^("browser.display.windows.non_native_menus", 0^);
@echo defaultPref^("browser.download.animateNotifications", false^);
@echo defaultPref^("browser.download.autohideButton", true^);
@echo defaultPref^("browser.download.forbid_open_with", true^);
@echo defaultPref^("browser.download.hide_plugins_without_extensions", false^);
@echo defaultPref^("browser.download.importedFromSqlite", true^);
@echo defaultPref^("browser.download.manager.addToRecentDocs", false^);
@echo defaultPref^("browser.download.panel.shown", true^);
@echo defaultPref^("browser.download.useDownloadDir", false^);
@echo defaultPref^("browser.eme.ui.enabled", false^);
@echo defaultPref^("browser.feeds.showFirstRunUI", false^);
@echo defaultPref^("browser.fixup.alternate.enabled", false^);
@echo defaultPref^("browser.formautofill.enabled", false^);
@echo defaultPref^("browser.formfill.enable", false^);
@echo defaultPref^("browser.fullscreen.animate", false^);
@echo defaultPref^("browser.fullscreen.animateUp", 0^);
@echo defaultPref^("browser.history_swipe_animation.disabled", true^);
@echo defaultPref^("browser.in-content.dark-mode", false^);
@echo defaultPref^("browser.link.open_newwindow.disabled_in_fullscreen", true^);
@echo defaultPref^("browser.link.open_newwindow.override.external", 0^);
@echo defaultPref^("browser.link.open_newwindow.restriction", 0^);
@echo defaultPref^("browser.menu.showCharacterEncoding", "false"^);
@echo defaultPref^("browser.messaging-system.whatsNewPanel.enabled", false^);
@echo defaultPref^("browser.newtab.preload", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.aboutHome.enabled", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.discoverystream.enabled", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.discoverystream.endpointSpocsClear", ""^);
@echo defaultPref^("browser.newtabpage.activity-stream.discoverystream.endpoints", ""^);
@echo defaultPref^("browser.newtabpage.activity-stream.enabled", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.feeds.section.highlights", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.feeds.snippets", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.feeds.system.topsites", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.feeds.telemetry", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.feeds.topsites", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.filterAdult", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.fxaccounts.endpoint", ""^);
@echo defaultPref^("browser.newtabpage.activity-stream.hideTopSitesTitle", true^);
@echo defaultPref^("browser.newtabpage.activity-stream.migrationExpired", true^);
@echo defaultPref^("browser.newtabpage.activity-stream.prerender", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.section.highlights.includePocket", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.section.highlights.includeVisited", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.showSearch", true^);
@echo defaultPref^("browser.newtabpage.activity-stream.showSponsored", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.showSponsoredTopSites", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.showTopSites", true^);
@echo defaultPref^("browser.newtabpage.activity-stream.telemetry", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.telemetry.ping.endpoint", ""^);
@echo defaultPref^("browser.newtabpage.activity-stream.telemetry.structuredIngestion", false^);
@echo defaultPref^("browser.newtabpage.activity-stream.telemetry.structuredIngestion.endpoint", ""^);
@echo defaultPref^("browser.newtabpage.activity-stream.topSitesRows", 4^);
@echo defaultPref^("browser.newtabpage.columns", 3^);
@echo defaultPref^("browser.newtabpage.directory.ping", ""^);
@echo defaultPref^("browser.newtabpage.directory.source", ""^);
@echo defaultPref^("browser.newtabpage.enabled", false^);
@echo defaultPref^("browser.newtabpage.enhanced", false^);
@echo defaultPref^("browser.newtabpage.introShown", true^);
@echo defaultPref^("browser.newtabpage.pinned", "[]"^);
@echo defaultPref^("browser.newtabpage.rows", 2^);
@echo defaultPref^("browser.newtabpage.storageVersion", 1^);
@echo defaultPref^("browser.onboarding.enabled", false^);
@echo defaultPref^("browser.onboarding.hidden", true^);
@echo defaultPref^("browser.pagethumbnails.capturing_disabled", true^);
@echo defaultPref^("browser.pagethumbnails.storage_version", 3^);
@echo defaultPref^("browser.partnerlink.attributionURL", ""^);
@echo defaultPref^("browser.ping-centre.production.endpoint", ""^);
@echo defaultPref^("browser.ping-centre.staging.endpoint", ""^);
@echo defaultPref^("browser.ping-centre.telemetry", false^);
@echo defaultPref^("browser.places.importBookmarksHTML", false^);
@echo defaultPref^("browser.places.smartBookmarksVersion", 7^);
@echo defaultPref^("browser.pocket.enabled", false^);
@echo defaultPref^("browser.preferences.advanced.selectedTabIndex", 0^);
@echo defaultPref^("browser.preferences.defaultPerformanceSettings.enabled", false^);
@echo defaultPref^("browser.preferences.inContent", true^);
@echo defaultPref^("browser.privacySegmentation.createdShortcut", true^);
@echo defaultPref^("browser.privatebrowsing.autostart", false^);
@echo defaultPref^("browser.privatebrowsing.enable-new-indicator", false^);
@echo defaultPref^("browser.proton.enabled", false^);
@echo defaultPref^("browser.region.network.url", ""^);
@echo defaultPref^("browser.region.update.enabled", false^);
@echo defaultPref^("browser.rights.3.shown", true^);
@echo defaultPref^("browser.safebrowsing.allowOverride", false^);
@echo defaultPref^("browser.safebrowsing.appRepURL", ""^);
@echo defaultPref^("browser.safebrowsing.blockedURIs.enabled", false^);
@echo defaultPref^("browser.safebrowsing.downloads.enabled", false^);
@echo defaultPref^("browser.safebrowsing.downloads.remote.block_dangerous", false^);
@echo defaultPref^("browser.safebrowsing.downloads.remote.block_dangerous_host", false^);
@echo defaultPref^("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false^);
@echo defaultPref^("browser.safebrowsing.downloads.remote.block_uncommon", false^);
@echo defaultPref^("browser.safebrowsing.downloads.remote.enabled", false^);
@echo defaultPref^("browser.safebrowsing.downloads.remote.url", ""^);
@echo defaultPref^("browser.safebrowsing.enabled", false^);
@echo defaultPref^("browser.safebrowsing.gethashURL", ""^);
@echo defaultPref^("browser.safebrowsing.malware.enabled", false^);
@echo defaultPref^("browser.safebrowsing.malware.reportURL", ""^);
@echo defaultPref^("browser.safebrowsing.passwords.enabled", false^);
@echo defaultPref^("browser.safebrowsing.phishing.enabled", false^);
@echo defaultPref^("browser.safebrowsing.provider.google.advisoryName", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google.advisoryURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google.appRepURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google.gethashURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google.reportMalwareMistakeURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google.reportPhishMistakeURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google.reportURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google.updateURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google4.advisoryName", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google4.advisoryURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google4.dataSharingURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google4.gethashURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google4.gethashURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google4.reportMalwareMistakeURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google4.reportPhishMistakeURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google4.reportURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.google4.updateURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.mozilla.gethashURL", ""^);
@echo defaultPref^("browser.safebrowsing.provider.mozilla.lastupdatetime", ""^);
@echo defaultPref^("browser.safebrowsing.provider.mozilla.nextupdatetime", ""^);
@echo defaultPref^("browser.safebrowsing.provider.mozilla.updateURL", ""^);
@echo defaultPref^("browser.safebrowsing.reportErrorURL", ""^);
@echo defaultPref^("browser.safebrowsing.reportGenericURL", ""^);
@echo defaultPref^("browser.safebrowsing.reportMalwareErrorURL", ""^);
@echo defaultPref^("browser.safebrowsing.reportMalwareMistakeURL", ""^);
@echo defaultPref^("browser.safebrowsing.reportMalwareURL", ""^);
@echo defaultPref^("browser.safebrowsing.reportPhishMistakeURL", ""^);
@echo defaultPref^("browser.safebrowsing.reportPhishURL", ""^);
@echo defaultPref^("browser.safebrowsing.reportURL", ""^);
@echo defaultPref^("browser.safebrowsing.updateURL", ""^);
@echo defaultPref^("browser.search.geoip.url", ""^);
@echo defaultPref^("browser.search.geoSpecificDefaults", false^);
@echo defaultPref^("browser.search.geoSpecificDefaults.url", ""^);
@echo defaultPref^("browser.search.reset.enabled", false^);
@echo defaultPref^("browser.search.reset.whitelist", ""^);
@echo defaultPref^("browser.search.serpEventTelemetryCategorization.enabled", false^);
@echo defaultPref^("browser.search.suggest.enabled", false^);
@echo defaultPref^("browser.search.suggest.enabled.private", false^);
@echo defaultPref^("browser.search.update", false^);
@echo defaultPref^("browser.search.update.log", false^);
@echo defaultPref^("browser.search.widget.inNavBar", true^);
@echo defaultPref^("browser.selfsupport.url", ""^);
@echo defaultPref^("browser.sessionhistory.max_entries", 128^);
@echo defaultPref^("browser.sessionstore.max_tabs_undo", 32^);
@echo defaultPref^("browser.sessionstore.restore_tabs_lazily", false^);
@echo defaultPref^("browser.sessionstore.restore_on_demand", false^);
@echo defaultPref^("browser.sessionstore.warnOnQuit", true^);
@echo defaultPref^("browser.shell.checkDefaultBrowser", false^);
@echo defaultPref^("browser.shopping.experience2023.active", false^);
@echo defaultPref^("browser.shopping.experience2023.ads.enabled", false^);
@echo defaultPref^("browser.shopping.experience2023.ads.userEnabled", false^);
@echo defaultPref^("browser.shopping.experience2023.enabled", false^);
@echo defaultPref^("browser.shopping.experience2023.optedIn", 0^);
@echo defaultPref^("browser.shopping.experience2023.survey.enabled", false^);
@echo defaultPref^("browser.shopping.experience2023.survey.hasSeen", false^);
@echo defaultPref^("browser.shopping.experience2023.survey.pdpVisits", 0^);
@echo defaultPref^("browser.slowStartup.averageTime", 0^);
@echo defaultPref^("browser.slowStartup.notificationDisabled", true^);
@echo defaultPref^("browser.slowStartup.samples", 0^);
@echo defaultPref^("browser.startup.blankWindow", false^);
@echo defaultPref^("browser.startup.homepage", "about:newtab"^);
@echo defaultPref^("browser.startup.homepage_override.mstone", "ignore"^);
@echo defaultPref^("browser.startup.page", 3^);
@echo defaultPref^("browser.suppress_first_window_animation", false^);
@echo defaultPref^("browser.tabs.animate", false^);
@echo defaultPref^("browser.tabs.closeWindowWithLastTab", false^);
@echo defaultPref^("browser.tabs.crashReporting.sendReport", false^);
@echo defaultPref^("browser.tabs.firefox-view", false^);
@echo defaultPref^("browser.tabs.loadInBackground", false^);
@echo defaultPref^("browser.tabs.maxOpenBeforeWarn", 10^);
@echo defaultPref^("browser.tabs.remote.autostart", false^);
@echo defaultPref^("browser.tabs.remote.autostart.2", false^);
@echo defaultPref^("browser.tabs.tabMinWidth", 40^);
@echo defaultPref^("browser.taskbar.previews.enable", true^);
@echo defaultPref^("browser.theme.dark-private-windows", false^);
@echo defaultPref^("browser.topsites.contile.enabled", false^);
@echo defaultPref^("browser.toolbarbuttons.introduced.pocket-button", true^);
@echo defaultPref^("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"urlbar-container\",\"save-to-pocket-button\",\"downloads-button\",\"fxa-toolbar-menu-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\",\"TabsToolbar\",\"toolbar-menubar\"],\"currentVersion\":19,\"newElementCount\":3}"^);
@echo defaultPref^("browser.uidensity", 1^);
@echo defaultPref^("browser.uitour.enabled", false^);
@echo defaultPref^("browser.urlbar.formatting.enabled", false^);
@echo defaultPref^("browser.urlbar.oneOffSearches", false^);
@echo defaultPref^("browser.urlbar.searchSuggestionsChoice", false^);
@echo defaultPref^("browser.urlbar.suggest.searches", false^);
@echo defaultPref^("browser.urlbar.suggest.topsites", false^);
@echo defaultPref^("browser.urlbar.trimURLs", false^);
@echo defaultPref^("browser.urlbar.update1", false^);
@echo defaultPref^("browser.vpn_promo.enabled", false^);
@echo defaultPref^("camera.control.face_detection.enabled", false^);
@echo defaultPref^("canvas.capturestream.enabled", false^);
@echo defaultPref^("captivedetect.canonicalURL", ""^);
@echo defaultPref^("datareporting.healthreport.about.reportUrl", ""^);
@echo defaultPref^("datareporting.healthreport.about.reportUrlUnified", ""^);
@echo defaultPref^("datareporting.healthreport.documentServerURI", ""^);
@echo defaultPref^("datareporting.healthreport.infoURL", ""^);
@echo defaultPref^("datareporting.healthreport.service.enabled", false^);
@echo defaultPref^("datareporting.healthreport.service.firstRun", true^);
@echo defaultPref^("datareporting.healthreport.uploadEnabled", false^);
@echo defaultPref^("datareporting.policy.dataSubmissionEnabled", false^);
@echo defaultPref^("datareporting.policy.dataSubmissionEnabled.v2", false^);
@echo defaultPref^("datareporting.policy.firstRunURL", ""^);
@echo defaultPref^("default-browser-agent.enabled", false^);
@echo defaultPref^("device.sensors.enabled", false^);
@echo defaultPref^("device.sensors.motion.enabled", false^);
@echo defaultPref^("device.sensors.orientation.enabled", false^);
@echo defaultPref^("devtools.enabled", true^);
@echo defaultPref^("devtools.onboarding.telemetry.logged", false^);
@echo defaultPref^("distribution.iniFile.exists.value", true^);
@echo defaultPref^("distribution.mozilla-EMEfree.bookmarksProcessed", true^);
@echo defaultPref^("dom.allow_scripts_to_close_windows", false^);
@echo defaultPref^("dom.battery.enabled", false^);
@echo // defaultPref^("dom.caches.enabled", false^);
@echo defaultPref^("dom.disable_beforeunload", true^);
@echo defaultPref^("dom.disable_window_flip", false^);
@echo defaultPref^("dom.disable_window_move_resize", true^);
@echo defaultPref^("dom.disable_window_open_feature.close", true^);
@echo defaultPref^("dom.disable_window_open_feature.location", false^);
@echo defaultPref^("dom.disable_window_open_feature.minimizable", true^);
@echo defaultPref^("dom.disable_window_open_feature.personalbar", true^);
@echo defaultPref^("dom.disable_window_open_feature.titlebar", true^);
@echo defaultPref^("dom.disable_window_status_change", false^);
@echo // defaultPref^("dom.enable_performance", false^);
@echo defaultPref^("dom.enable_performance_navigation_timing", false^);
@echo defaultPref^("dom.enable_performance_observer", false^);
@echo defaultPref^("dom.enable_resource_timing", false^);
@echo defaultPref^("dom.enable_user_timing", false^);
@echo defaultPref^("dom.event.clipboardevents.enabled", false^);
@echo defaultPref^("dom.gamepad.enabled", false^);
@echo defaultPref^("dom.gamepad.extensions.enabled", false^);
@echo defaultPref^("dom.gamepad.non_standard_events.enabled", false^);
@echo defaultPref^("dom.idle-observers-api.enabled", false^);
@echo defaultPref^("dom.indexedDB.logging.details", false^);
@echo defaultPref^("dom.indexedDB.logging.enabled", false^);
@echo defaultPref^("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false^);
@echo defaultPref^("dom.ipc.plugins.reportCrashURL", false^);
@echo defaultPref^("dom.ipc.processCount", 1^);
@echo defaultPref^("dom.keyboardevent.dispatch_during_composition", false^);
@echo defaultPref^("dom.mozApps.used", true^);
@echo defaultPref^("dom.netinfo.enabled", false^);
@echo defaultPref^("dom.network.enabled", false^);
@echo defaultPref^("dom.private-attribution.submission.enabled", false^);
@echo defaultPref^("dom.push.connection.enabled", false^);
@echo defaultPref^("dom.push.enabled", false^);
@echo defaultPref^("dom.push.serverURL", ""^);
@echo // defaultPref^("dom.security.https_first", true^);
@echo defaultPref^("dom.security.https_only_mode", true^);
@echo defaultPref^("dom.security.https_only_mode_ever_enabled", true^);
@echo defaultPref^("dom.security.https_only_mode_ever_enabled_pbm", true^);
@echo defaultPref^("dom.serviceWorkers.enabled", false^);
@echo defaultPref^("dom.sms.enabled", false^);
@echo defaultPref^("dom.vibrator.enabled", false^);
@echo defaultPref^("dom.vr.enabled", false^);
@echo defaultPref^("dom.vr.oculus.enabled", false^);
@echo defaultPref^("dom.vr.oculus.invisible.enabled", false^);
@echo defaultPref^("dom.vr.poseprediction.enabled", false^);
@echo defaultPref^("dom.vr.require-gesture", false^);
@echo defaultPref^("dom.w3c_touch_events.enabled", 0^);
@echo defaultPref^("dom.webaudio.enabled", false^);
@echo defaultPref^("dom.webnotifications.enabled", false^);
@echo defaultPref^("dom.webnotifications.serviceworker.enabled", false^);
@echo defaultPref^("experiments.activeExperiment", false^);
@echo defaultPref^("experiments.enabled", false^);
@echo defaultPref^("experiments.manifest.uri", ""^);
@echo defaultPref^("experiments.supported", false^);
@echo defaultPref^("extensions.abuseReport.enabled", false^);
@echo defaultPref^("extensions.blocklist.enabled", false^);
@echo defaultPref^("extensions.blocklist.pingCountTotal", 2^);
@echo defaultPref^("extensions.blocklist.pingCountVersion", 0^);
@echo defaultPref^("extensions.bootstrappedAddons", "{}"^);
@echo defaultPref^("extensions.databaseSchema", 16^);
@echo defaultPref^("extensions.e10sBlockedByAddons", true^);
@echo defaultPref^("extensions.e10sBlocksEnabling", true^);
@echo defaultPref^("extensions.enabledAddons", "SimpleX%%40White.Theme:3.0"^);
@echo defaultPref^("extensions.formautofill.addresses.enabled", false^);
@echo defaultPref^("extensions.formautofill.creditCards.enabled", false^);
@echo defaultPref^("extensions.formautofill.heuristics.enabled", false^);
@echo defaultPref^("extensions.getAddons.cache.enabled", false^);
@echo defaultPref^("extensions.getAddons.databaseSchema", 5^);
@echo defaultPref^("extensions.getAddons.showPane", false^);
@echo defaultPref^("extensions.htmlaboutaddons.discover.enabled", false^);
@echo defaultPref^("extensions.htmlaboutaddons.recommendations.enabled", false^);
@echo defaultPref^("extensions.manifestV3.enabled", false^);
@echo defaultPref^("extensions.pendingOperations", false^);
@echo defaultPref^("extensions.pocket.api", ""^);
@echo defaultPref^("extensions.pocket.enabled", false^);
@echo defaultPref^("extensions.pocket.oAuthConsumerKey", ""^);
@echo defaultPref^("extensions.pocket.site", ""^);
@echo defaultPref^("extensions.privatebrowsing.notification", true^);
@echo defaultPref^("extensions.ui.dictionary.hidden", true^);
@echo defaultPref^("extensions.ui.locale.hidden", true^);
@echo defaultPref^("extensions.unifiedExtensions.enabled", false^);
@echo defaultPref^("extensions.webcompat-reporter.enabled", false^);
@echo defaultPref^("extensions.webcompat-reporter.newIssueEndpoint", ""^);
@echo defaultPref^("extensions.webservice.discoverURL", ""^);
@echo defaultPref^("findbar.highlightAll", true^);
@echo defaultPref^("font.internaluseonly.changed", false^);
@echo defaultPref^("font.size.fixed.x-cyrillic", 13^);
@echo defaultPref^("font.size.monospace.x-cyrillic", 13^);
@echo defaultPref^("full-screen-api.warning.delay", 250^);
@echo defaultPref^("full-screen-api.warning.timeout", 1500^);
@echo defaultPref^("general.skins.selectedSkin", "simplewhitex"^);
@echo defaultPref^("general.smoothScroll", false^);
@echo defaultPref^("general.warnOnAboutConfig", false^);
@echo defaultPref^("geo.enabled", false^);
@echo defaultPref^("geo.provider.ms-windows-location", false^);
@echo defaultPref^("geo.wifi.logging.enabled", false^);
@echo defaultPref^("geo.wifi.uri", ""^);
@echo defaultPref^("gfx.canvas.skiagl.dynamic-cache", false^);
@echo defaultPref^("gfx.direct3d.last_used_feature_level_idx", 0^);
@echo defaultPref^("gfx.work-around-driver-bugs", false^);
@echo defaultPref^("identity.fxaccounts.enabled", false^);
@echo defaultPref^("intl.charsetmenu.browser.cache", "UTF-8"^);
@echo defaultPref^("javascript.options.shared_memory", true^);
@echo defaultPref^("keyword.enabled", false^);
@echo defaultPref^("layers.acceleration.force-enabled", true^);
@echo defaultPref^("layers.deaa.enabled", false^);
@echo defaultPref^("layers.geometry.opengl.enabled", false^);
@echo defaultPref^("layers.mlgpu.sanity-test-failed", false^);
@echo defaultPref^("lightweightThemes.update.enabled", false^);
@echo defaultPref^("loop.enabled", false^);
@echo defaultPref^("loop.feedback.formURL", ""^);
@echo defaultPref^("loop.gettingStarted.url", ""^);
@echo defaultPref^("media.autoplay.enabled", false^);
@echo defaultPref^("media.block-autoplay-until-in-foreground", true^);
@echo defaultPref^("media.block-play-until-visible", true^);
@echo defaultPref^("media.decoder-doctor.new-issue-endpoint", ""^);
@echo defaultPref^("media.eme.apiVisible", false^);
@echo defaultPref^("media.eme.enabled", false^);
@echo defaultPref^("media.getusermedia.aec_enabled", false^);
@echo defaultPref^("media.getusermedia.noise_enabled", false^);
@echo defaultPref^("media.getusermedia.screensharing.allowed_domains", ""^);
@echo defaultPref^("media.getusermedia.screensharing.enabled", false^);
@echo defaultPref^("media.gmp-eme-adobe.enabled", false^);
@echo defaultPref^("media.hardware-video-decoding.enabled", true^);
@echo defaultPref^("media.hardware-video-decoding.failed", false^);
@echo defaultPref^("media.hardware-video-decoding.force-enabled", true^);
@echo defaultPref^("media.navigator.enabled", false^);
@echo defaultPref^("media.navigator.permission.disabled", true^);
@echo defaultPref^("media.navigator.video.enabled", false^);
@echo defaultPref^("media.ondevicechange.enabled", false^);
@echo defaultPref^("media.peerconnection.enabled", false^);
@echo defaultPref^("media.peerconnection.ice.default_address_only", true^);
@echo defaultPref^("media.peerconnection.ice.no_host", true^);
@echo defaultPref^("media.peerconnection.ice.relay_only", true^);
@echo defaultPref^("media.peerconnection.ice.tcp", false^);
@echo defaultPref^("media.peerconnection.identity.enabled", false^);
@echo defaultPref^("media.peerconnection.identity.timeout", 1^);
@echo defaultPref^("media.peerconnection.turn.disable", true^);
@echo defaultPref^("media.peerconnection.use_document_iceservers", false^);
@echo defaultPref^("media.peerconnection.video.enabled", false^);
@echo defaultPref^("media.video_stats.enabled", false^);
@echo defaultPref^("media.videocontrols.picture-in-picture.improved-video-controls.enabled", true^);
@echo defaultPref^("media.webspeech.recognition.enable", false^);
@echo defaultPref^("media.webspeech.recognition.force_enable", false^);
@echo defaultPref^("media.webspeech.synth.enabled", false^);
@echo defaultPref^("media.wmf.deblacklisting-for-telemetry-in-gpu-process", false^);
@echo defaultPref^("mousewheel.default.delta_multiplier_y", 450^);
@echo // defaultPref^("mousewheel.min_line_scroll_amount", 5^);
@echo defaultPref^("network.allow-experiments", false^);
@echo defaultPref^("network.captive-portal-service.enabled", false^);
@echo defaultPref^("network.captive-portal-service.maxInterval", 0^);
@echo defaultPref^("network.cookie.cookieBehavior", 1^);
@echo // defaultPref^("network.cookie.lifetimePolicy", 2^);
@echo defaultPref^("network.cookie.prefsMigrated", true^);
@echo defaultPref^("network.cookie.thirdparty.sessionOnly", true^);
@echo // defaultPref^("network.dns.disableIPv6", true^);
@echo defaultPref^("network.dns.disablePrefetch", true^);
@echo defaultPref^("network.dns.disablePrefetchFromHTTPS", true^);
@echo defaultPref^("network.http.altsvc.enabled", false^);
@echo defaultPref^("network.http.altsvc.oe", false^);
@echo defaultPref^("network.http.speculative-parallel-limit", 0^);
@echo defaultPref^("network.dns.offline-localhost", true^);
@echo defaultPref^("network.predictor.enabled", false^);
@echo defaultPref^("network.predictor.enable-prefetch", false^);
@echo defaultPref^("network.prefetch-next", false^);
@echo defaultPref^("network.security.esni.enabled", true^);
@echo defaultPref^("network.tcp.tcp_fastopen_enable", true^);
@echo defaultPref^("network.trr.mode", 1^);
@echo defaultPref^("nglayout.initialpaint.delay", 5^);
@echo defaultPref^("pdfjs.enabledCache.state", false^);
@echo defaultPref^("pdfjs.enableScripting", false^);
@echo defaultPref^("pdfjs.migrationVersion", 2^);
@echo defaultPref^("pdfjs.previousHandler.alwaysAskBeforeHandling", true^);
@echo defaultPref^("pdfjs.previousHandler.preferredAction", 4^);
@echo defaultPref^("plugin.disable_full_page_plugin_for_types", "application/pdf"^);
@echo defaultPref^("plugin.importedState", true^);
@echo defaultPref^("pref.browser.homepage.disable_button.bookmark_page", false^);
@echo defaultPref^("pref.browser.homepage.disable_button.current_page", false^);
@echo defaultPref^("pref.browser.homepage.disable_button.restore_default", false^);
@echo defaultPref^("pref.downloads.disable_button.edit_actions", false^);
@echo defaultPref^("pref.general.disable_button.default_browser", false^);
@echo defaultPref^("pref.privacy.disable_button.cookie_exceptions", false^);
@echo defaultPref^("pref.privacy.disable_button.view_cookies", false^);
@echo defaultPref^("pref.privacy.disable_button.view_passwords", false^);
@echo defaultPref^("privacy.donottrackheader.enabled", true^);
@echo defaultPref^("privacy.firstparty.isolate", false^);
@echo defaultPref^("privacy.history.custom", true^);
@echo defaultPref^("privacy.reduceTimerPrecision", true^);
@echo defaultPref^("privacy.resistFingerprinting", false^);
@echo defaultPref^("privacy.sanitize.migrateFx3Prefs", true^);
@echo defaultPref^("privacy.socialtracking.block_cookies.enabled", true^);
@echo defaultPref^("privacy.trackingprotection.enabled", true^);
@echo defaultPref^("reader.parse-on-load.enabled", false^);
@echo defaultPref^("readinglist.scheduler.enabled", false^);
@echo defaultPref^("readinglist.server", ""^);
@echo defaultPref^("security.app_menu.recordEventTelemetry", false^);
@echo defaultPref^("security.certerrors.recordEventTelemetry", false^);
@echo defaultPref^("security.identityblock.show_extended_validation", true^);
@echo defaultPref^("security.identitypopup.recordEventTelemetry", false^);
@echo defaultPref^("security.insecure_connection_text.enabled", false^);
@echo defaultPref^("security.protectionspopup.recordEventTelemetry", false^);
@echo defaultPref^("security.secure_connection_icon_color_gray", false^);
@echo defaultPref^("security.ssl.errorReporting.enabled", false^);
@echo defaultPref^("security.ssl.errorReporting.url", ""^);
@echo defaultPref^("services.sync.clients.lastSync", "0"^);
@echo defaultPref^("services.sync.clients.lastSyncLocal", "0"^);
@echo defaultPref^("services.sync.declinedEngines", ""^);
@echo defaultPref^("services.sync.enabled", false^);
@echo defaultPref^("services.sync.globalScore", 0^);
@echo defaultPref^("services.sync.migrated", true^);
@echo defaultPref^("services.sync.nextSync", 0^);
@echo defaultPref^("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored", false^);
@echo defaultPref^("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites", false^);
@echo defaultPref^("services.sync.tabs.lastSync", "0"^);
@echo defaultPref^("services.sync.tabs.lastSyncLocal", "0"^);
@echo defaultPref^("signon.autofillForms", false^);
@echo defaultPref^("signon.firefoxRelay.feature", "disabled"^);
@echo defaultPref^("signon.generation.enabled", false^);
@echo defaultPref^("signon.management.page.breach-alerts.enabled", false^);
@echo defaultPref^("signon.rememberSignons", false^);
@echo defaultPref^("social.directories", ""^);
@echo defaultPref^("social.remote-install.enabled", false^);
@echo defaultPref^("social.share.activationPanelEnabled", false^);
@echo defaultPref^("social.shareDirectory", ""^);
@echo defaultPref^("social.toast-notifications.enabled", false^);
@echo defaultPref^("social.whitelist", ""^);
@echo defaultPref^("toolkit.cosmeticAnimations.enabled", false^);
@echo defaultPref^("toolkit.coverage.endpoint.base", ""^);
@echo defaultPref^("toolkit.crashreporter.infoURL", ""^);
@echo defaultPref^("toolkit.datacollection.infoURL", ""^);
@echo defaultPref^("toolkit.legacyUserProfileCustomizations.stylesheets", true^);
@echo defaultPref^("toolkit.shopping.ohttpConfigURL", ""^);
@echo defaultPref^("toolkit.shopping.ohttpRelayURL", ""^);
@echo defaultPref^("toolkit.telemetry.archive.enabled", false^);
@echo defaultPref^("toolkit.telemetry.bhrPing.enabled", false^);
@echo defaultPref^("toolkit.telemetry.cachedClientID", ""^);
@echo defaultPref^("toolkit.telemetry.enabled", false^);
@echo defaultPref^("toolkit.telemetry.firstShutdownPing.enabled", false^);
@echo defaultPref^("toolkit.telemetry.hybridContent.enabled", false^);
@echo defaultPref^("toolkit.telemetry.newProfilePing.enabled", false^);
@echo defaultPref^("toolkit.telemetry.optoutSample", false^);
@echo defaultPref^("toolkit.telemetry.pioneer-new-studies-available", false^);
@echo defaultPref^("toolkit.telemetry.reportingpolicy.firstRun", false^);
@echo defaultPref^("toolkit.telemetry.server", ""^);
@echo defaultPref^("toolkit.telemetry.shutdownPingSender.enabled", false^);
@echo defaultPref^("toolkit.telemetry.shutdownPingSender.enabledFirstSession", false^);
@echo defaultPref^("toolkit.telemetry.unified", false^);
@echo defaultPref^("toolkit.telemetry.updatePing.enabled", false^);
@echo defaultPref^("toolkit.telemetry.unifiedIsOptIn", false^);
@echo defaultPref^("toolkit.zoomManager.zoomValues", ".25,.3,.5,.67,.75,.8,.9,1,1.1,1.25,1.33,1.5,1.7,2,2.4,3,4,5"^);
@echo defaultPref^("ui.prefersReducedMotion", 1^);
@echo defaultPref^("xpinstall.whitelist.add", ""^);
@echo defaultPref^("xpinstall.whitelist.add.180", ""^);
@echo defaultPref^("xul.panel-animations.enabled", false^);
@echo+
@echo defaultPref^("ui.useOverlayScrollbars", 1^);
@echo defaultPref^("widget.gtk.overlay-scrollbars.enabled", true^);
@echo defaultPref^("widget.non-native-theme.scrollbar.style", 5^);
@echo defaultPref^("widget.windows.overlay-scrollbars.enabled", true^);
@echo //  defaultPref^("widget.non-native-theme.scrollbar.style", 5^);  //  Default = 0 ; macOs = 1 ; GTK = 2 ; Android = 3 ; W10 = 4 ; W11 = 5
)>"r3dfoxPortable\core\autoconfiglocal.js"

(
@echo // autoconfig.js file needs to start with a comment
@echo pref^("general.config.filename", "autoconfiglocal.js"^);
@echo pref^("general.config.sandbox_enabled", false^);
@echo pref^("general.config.obscure_value", 0^);
)>"r3dfoxPortable\core\defaults\pref\autoconfig.js"

(
@echo # Partner Distribution Configuration File
@echo # Author: Mozilla
@echo # Date: 2015-03-27
@echo+
@echo [Global]
@echo id=mozilla-EMEfree
@echo version=1.0
@echo about=Mozilla Firefox EME-free
@echo+
@echo [Preferences]
@echo media.eme.enabled=false
@echo app.partner.mozilla-EMEfree="mozilla-EMEfree"
)>"r3dfoxPortable\core\distribution\distribution.ini"

(@echo {"policies":{"DisableAppUpdate":true}})>"r3dfoxPortable\core\distribution\policies.json"

@md "r3dfoxPortable\portable"
@md "r3dfoxPortable\portable\chrome"

(
@echo.@-moz-document domain^("youtube.com"^) {:root {scrollbar-width: none !important; /* thin/auto/none */} }
@echo.@-moz-document url^("about:privatebrowsing"^) { .showPrivate { display: none !important; } html.private { --in-content-page-background: menu !important; } }
@echo.:root {scrollbar-color: #ff9900 transparent !important; }
)>"r3dfoxPortable\portable\chrome\userContent.css"

(
@echo./* Left menu */
@echo.#PanelUI-button { -moz-box-ordinal-group:0 !important ; order:-1 !important ; margin-inline-start:0px !important ; margin-inline-end:0px !important ; border-inline-start:none !important ; border-inline-end:0px solid !important ; }
@echo..cui-widget-panel, #appMenu-popup { margin-left:1em !important; }
@echo.
@echo./* Tab's fonts */
@echo.#urlbar { font-family:Tahoma !important ; font-size:8pt !important ; }
@echo.#tabbrowser-tabs .tab-text{ font-family:Tahoma !important ; font-size:8pt !important ; font-weight:none !important ; }
@echo.
@echo./* ======================== */
@echo./* keyfox-main\userChrome.css */
@echo.
@echo./*Basic Settings*/
@echo.:root { --navbarWidth:42vw ; --animationSpeed:0.15s ; } /* Set width of navbar. Use px for a fixed width or vw for a percentage of your window. */
@echo.#TabsToolbar { margin-left:var^(--navbarWidth^) !important ; }
@echo.#nav-bar { margin-right:calc^(100vw - var^(--navbarWidth^)^) !important ; }
@echo.#urlbar-container { min-width:0px !important ; }
@echo.#urlbar-container { width:calc^(80px + 2 * var^(--toolbarbutton-inner-padding^)^) !important; }
@echo.:root[uidensity="compact"] #nav-bar { margin-top:-31px !important ; height:31px !important ; }
@echo.:root:not^([uidensity="compact"]^):not^([uidensity="touch"]^) #nav-bar { margin-top:-44px !important ; height:44px !important ; }
@echo.:root[uidensity="touch"] #nav-bar { margin-top:-49px !important ; height:49px !important ; }
@echo.
@echo./* Simplifying interface */
@echo.#nav-bar { background:none !important ; box-shadow:none !important ;}
@echo.#navigator-toolbox { border:none !important ;}
@echo..titlebar-spacer { display:none !important ;}
@echo.#urlbar-background { border:none !important ;}
@echo./* #urlbar:not^(:hover^):not^([breakout][breakout-extend]^) ^> #urlbar-background { box-shadow:none !important ; background:none !important } */
@echo.
@echo./* Element Hiding stuff */
@echo..urlbar-icon, #userContext-indicator, #userContext-label { fill:transparent !important ; background:transparent !important ; color:transparent !important ; }
@echo.#urlbar:hover .urlbar-icon, #urlbar:active .urlbar-icon, #urlbar[focused] .urlbar-icon { fill:var^(--toolbar-color^) !important ;}
@echo./* ======================== */
@echo.
@echo./* Tab's corners */
@echo.@-moz-document url^("chrome://browser/content/browser.xhtml"^) { :root {
@echo. --tab-block-margin:0px !important ;
@echo. --tab-border-radius:0px !important ;
@echo. --toolbarbutton-outer-padding:1px !important ;
@echo. --toolbarbutton-inner-padding:4px !important ;
@echo. --toolbar-start-end-padding:1px !important ;
@echo. --bookmark-block-padding:1px !important ;
@echo. --urlbar-min-height:24px !important ;
@echo. --urlbar-icon-padding:3px !important ;
@echo.} }
@echo.
@echo./* Overlink */
@echo.#statuspanel[type="overLink"] { opacity:90%% !important ; }
@echo.#statuspanel-label { color:black !important; }
@echo.@media ^(-moz-windows-default-theme^)             {  #statuspanel-label { color:black !important; }}
@echo.@media ^(-moz-content-prefers-color-scheme:dark^) {  #statuspanel-label { color:white !important; }}
@echo.
@echo./* #tabbrowser-tabpanels { background-color:menu !important; } */
@echo.#tabbrowser-tabpanels { background-color: white !important; }
@echo.
@echo./* ======================== */
@echo./*  Alltabs button  */
@echo.#TabsToolbar-customization-target {counter-reset: tabCount}.tabbrowser-tab {counter-increment: tabCount}
@echo.#alltabs-button^>.toolbarbutton-badge-stack^>.toolbarbutton-icon {list-style-image: url^("data:image/svg+xml,%%3Csvg width='40' height='30' version='1.1' viewBox='0 0 40 30' xmlns='http://www.w3.org/2000/svg'%%3E%%3Ctitle%%3EVetro%%3C/title%%3E%%3Cpath transform='translate(49,-60)' d='m-29 78.888-7.0703-7.0703 0.70703-0.70703 6.3633 6.3633 6.3633-6.3633 0.70703 0.70703-6.3633 6.3633z' fill='currentColor' style='paint-order:stroke fill markers'/%%3E%%3C/svg%%3E"^); overflow: hidden!important; padding: 0!important; border: 0!important; width: 40px!important; height: calc^(100%% + 1px^)!important; margin: 0 -2px 0 0!important; transform: translate^(20%%,15%%^); padding: 0 3px}
@echo.#alltabs-button^>.toolbarbutton-badge-stack {position: relative!important; border-radius: 0!important; padding: 0!important; border: 0!important; height: calc^(100%% + 1px^)!important; width: 56px!important; margin: 0-2px 0 0!important}
@echo.#alltabs-button^>.toolbarbutton-badge-stack::before {content: counter^(tabCount^); filter:contrast^(500%%^)grayscale^(100%%^); color: currentColor !important; position: absolute; bottom: 25%%; left: 50%%; transform: translate^(-50%%,-30%%^); padding: 0 3px}
@echo./* ======================== */
@echo.
@echo./* 117 */
@echo.menupopup, .menupopup-arrowscrollbox { border-radius:0px !important; }
@echo.menupopup ^> menuitem, menupopup ^> menu { padding-block:2px !important; }  /* Set spacing here 0-4px */
@echo.:root { --arrowpanel-menuitem-padding: 0px 4px !important; } /* Options menu spacing */
@echo.
@echo./* 119 */
@echo.#private-browsing-indicator-with-label ^> label {display: none;}
)>"r3dfoxPortable\portable\chrome\userChrome.css"

(@echo {"windows":[],"selectedWindow":0,"_closedWindows":[],"session":{},"scratchpads":[],"global":{}})>"r3dfoxPortable\portable\sessionstore.js"

(
@echo // Mozilla User Preferences
@echo+
@echo // DO NOT EDIT THIS FILE.
@echo //
@echo // If you make changes to this file while the application is running,
@echo // the changes will be overwritten when the application exits.
@echo //
@echo // To change a preference value, you can either:
@echo // - modify it via the UI ^(e.g. via about:config in the browser^); or
@echo // - set it within a user.js file in your profile.
@echo+
@echo user_pref^("accessibility.blockautorefresh", true^);
@echo user_pref^("accessibility.handler.enabled", false^);
@echo user_pref^("accessibility.typeaheadfind", true^);
@echo user_pref^("accessibility.typeaheadfind.flashBar", 0^);
@echo user_pref^("alerts.disableSlidingEffect", true^);
@echo user_pref^("app.normandy.api_url", ""^);
@echo user_pref^("app.normandy.enabled", false^);
@echo user_pref^("app.normandy.first_run", false^);
@echo user_pref^("app.shield.optoutstudies.enabled", false^);
@echo user_pref^("app.support.e10sAccessibilityUrl", ""^);
@echo user_pref^("app.update.auto", false^);
@echo user_pref^("app.update.checkInstallTime", false^);
@echo user_pref^("app.update.disable_button.showUpdateHistory", false^);
@echo user_pref^("app.update.enabled", false^);
@echo user_pref^("app.update.migrated.updateDir", true^);
@echo user_pref^("app.update.service.enabled", false^);
@echo user_pref^("app.update.url", ""^);
@echo user_pref^("app.update.url.details", ""^);
@echo user_pref^("app.update.url.manual", ""^);
@echo user_pref^("beacon.enabled", false^);
@echo user_pref^("breakpad.reportURL", ""^);
@echo user_pref^("browser.aboutConfig.showWarning", false^);
@echo user_pref^("browser.aboutHomeSnippets.updateUrl", ""^);
@echo user_pref^("browser.bookmarks.restore_default_bookmarks", false^);
@echo user_pref^("browser.bookmarks.showRecentlyBookmarked", false^);
@echo user_pref^("browser.cache.disk.capacity", 0^);
@echo user_pref^("browser.cache.disk.enable", false^);
@echo user_pref^("browser.cache.disk.smart_size.enabled", false^);
@echo user_pref^("browser.cache.disk.smart_size.first_run", false^);
@echo user_pref^("browser.cache.disk_cache_ssl", false^);
@echo user_pref^("browser.cache.memory.capacity", -1^);
@echo user_pref^("browser.cache.offline.enable", false^);
@echo user_pref^("browser.cache.offline.insecure.enable", false^);
@echo user_pref^("browser.cache.offline.storage.enable", false^);
@echo user_pref^("browser.chrome.errorReporter.enabled", false^);
@echo user_pref^("browser.chrome.errorReporter.infoURL", ""^);
@echo user_pref^("browser.chrome.errorReporter.submitUrl", ""^);
@echo user_pref^("browser.contentblocking.report.endpoint_url", ""^);
@echo user_pref^("browser.ctrlTab.recentlyUsedOrder", false^);
@echo user_pref^("browser.customizemode.tip0.shown", true^);
@echo user_pref^("browser.defaultbrowser.notificationbar", false^);
@echo user_pref^("browser.display.windows.non_native_menus", 0^);
@echo user_pref^("browser.download.animateNotifications", false^);
@echo user_pref^("browser.download.autohideButton", true^);
@echo user_pref^("browser.download.forbid_open_with", true^);
@echo user_pref^("browser.download.hide_plugins_without_extensions", false^);
@echo user_pref^("browser.download.importedFromSqlite", true^);
@echo user_pref^("browser.download.manager.addToRecentDocs", false^);
@echo user_pref^("browser.download.panel.shown", true^);
@echo user_pref^("browser.download.useDownloadDir", false^);
@echo user_pref^("browser.eme.ui.enabled", false^);
@echo user_pref^("browser.feeds.showFirstRunUI", false^);
@echo user_pref^("browser.fixup.alternate.enabled", false^);
@echo user_pref^("browser.formautofill.enabled", false^);
@echo user_pref^("browser.formfill.enable", false^);
@echo user_pref^("browser.fullscreen.animate", false^);
@echo user_pref^("browser.fullscreen.animateUp", 0^);
@echo user_pref^("browser.history_swipe_animation.disabled", true^);
@echo user_pref^("browser.in-content.dark-mode", false^);
@echo user_pref^("browser.link.open_newwindow.disabled_in_fullscreen", true^);
@echo user_pref^("browser.link.open_newwindow.override.external", 0^);
@echo user_pref^("browser.link.open_newwindow.restriction", 0^);
@echo user_pref^("browser.menu.showCharacterEncoding", "false"^);
@echo user_pref^("browser.messaging-system.whatsNewPanel.enabled", false^);
@echo user_pref^("browser.newtab.preload", false^);
@echo user_pref^("browser.newtabpage.activity-stream.aboutHome.enabled", false^);
@echo user_pref^("browser.newtabpage.activity-stream.discoverystream.enabled", false^);
@echo user_pref^("browser.newtabpage.activity-stream.discoverystream.endpointSpocsClear", ""^);
@echo user_pref^("browser.newtabpage.activity-stream.discoverystream.endpoints", ""^);
@echo user_pref^("browser.newtabpage.activity-stream.enabled", false^);
@echo user_pref^("browser.newtabpage.activity-stream.feeds.section.highlights", false^);
@echo user_pref^("browser.newtabpage.activity-stream.feeds.snippets", false^);
@echo user_pref^("browser.newtabpage.activity-stream.feeds.system.topsites", false^);
@echo user_pref^("browser.newtabpage.activity-stream.feeds.telemetry", false^);
@echo user_pref^("browser.newtabpage.activity-stream.feeds.topsites", false^);
@echo user_pref^("browser.newtabpage.activity-stream.filterAdult", false^);
@echo user_pref^("browser.newtabpage.activity-stream.fxaccounts.endpoint", ""^);
@echo user_pref^("browser.newtabpage.activity-stream.hideTopSitesTitle", true^);
@echo user_pref^("browser.newtabpage.activity-stream.migrationExpired", true^);
@echo user_pref^("browser.newtabpage.activity-stream.prerender", false^);
@echo user_pref^("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false^);
@echo user_pref^("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false^);
@echo user_pref^("browser.newtabpage.activity-stream.section.highlights.includePocket", false^);
@echo user_pref^("browser.newtabpage.activity-stream.section.highlights.includeVisited", false^);
@echo user_pref^("browser.newtabpage.activity-stream.showSearch", true^);
@echo user_pref^("browser.newtabpage.activity-stream.showSponsored", false^);
@echo user_pref^("browser.newtabpage.activity-stream.showSponsoredTopSites", false^);
@echo user_pref^("browser.newtabpage.activity-stream.showTopSites", true^);
@echo user_pref^("browser.newtabpage.activity-stream.telemetry", false^);
@echo user_pref^("browser.newtabpage.activity-stream.telemetry.ping.endpoint", ""^);
@echo user_pref^("browser.newtabpage.activity-stream.telemetry.structuredIngestion", false^);
@echo user_pref^("browser.newtabpage.activity-stream.telemetry.structuredIngestion.endpoint", ""^);
@echo user_pref^("browser.newtabpage.activity-stream.topSitesRows", 4^);
@echo user_pref^("browser.newtabpage.columns", 3^);
@echo user_pref^("browser.newtabpage.directory.ping", ""^);
@echo user_pref^("browser.newtabpage.directory.source", ""^);
@echo user_pref^("browser.newtabpage.enabled", false^);
@echo user_pref^("browser.newtabpage.enhanced", false^);
@echo user_pref^("browser.newtabpage.introShown", true^);
@echo user_pref^("browser.newtabpage.pinned", "[]"^);
@echo user_pref^("browser.newtabpage.rows", 2^);
@echo user_pref^("browser.newtabpage.storageVersion", 1^);
@echo user_pref^("browser.onboarding.enabled", false^);
@echo user_pref^("browser.onboarding.hidden", true^);
@echo user_pref^("browser.pagethumbnails.capturing_disabled", true^);
@echo user_pref^("browser.pagethumbnails.storage_version", 3^);
@echo user_pref^("browser.partnerlink.attributionURL", ""^);
@echo user_pref^("browser.ping-centre.production.endpoint", ""^);
@echo user_pref^("browser.ping-centre.staging.endpoint", ""^);
@echo user_pref^("browser.ping-centre.telemetry", false^);
@echo user_pref^("browser.places.importBookmarksHTML", false^);
@echo user_pref^("browser.places.smartBookmarksVersion", 7^);
@echo user_pref^("browser.pocket.enabled", false^);
@echo user_pref^("browser.preferences.advanced.selectedTabIndex", 0^);
@echo user_pref^("browser.preferences.defaultPerformanceSettings.enabled", false^);
@echo user_pref^("browser.preferences.inContent", true^);
@echo user_pref^("browser.privacySegmentation.createdShortcut", true^);
@echo user_pref^("browser.privatebrowsing.autostart", false^);
@echo user_pref^("browser.privatebrowsing.enable-new-indicator", false^);
@echo user_pref^("browser.proton.enabled", false^);
@echo user_pref^("browser.region.network.url", ""^);
@echo user_pref^("browser.region.update.enabled", false^);
@echo user_pref^("browser.rights.3.shown", true^);
@echo user_pref^("browser.safebrowsing.allowOverride", false^);
@echo user_pref^("browser.safebrowsing.appRepURL", ""^);
@echo user_pref^("browser.safebrowsing.blockedURIs.enabled", false^);
@echo user_pref^("browser.safebrowsing.downloads.enabled", false^);
@echo user_pref^("browser.safebrowsing.downloads.remote.block_dangerous", false^);
@echo user_pref^("browser.safebrowsing.downloads.remote.block_dangerous_host", false^);
@echo user_pref^("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false^);
@echo user_pref^("browser.safebrowsing.downloads.remote.block_uncommon", false^);
@echo user_pref^("browser.safebrowsing.downloads.remote.enabled", false^);
@echo user_pref^("browser.safebrowsing.downloads.remote.url", ""^);
@echo user_pref^("browser.safebrowsing.enabled", false^);
@echo user_pref^("browser.safebrowsing.gethashURL", ""^);
@echo user_pref^("browser.safebrowsing.malware.enabled", false^);
@echo user_pref^("browser.safebrowsing.malware.reportURL", ""^);
@echo user_pref^("browser.safebrowsing.passwords.enabled", false^);
@echo user_pref^("browser.safebrowsing.phishing.enabled", false^);
@echo user_pref^("browser.safebrowsing.provider.google.advisoryName", ""^);
@echo user_pref^("browser.safebrowsing.provider.google.advisoryURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google.appRepURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google.gethashURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google.reportMalwareMistakeURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google.reportPhishMistakeURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google.reportURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google.updateURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google4.advisoryName", ""^);
@echo user_pref^("browser.safebrowsing.provider.google4.advisoryURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google4.dataSharingURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google4.gethashURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google4.gethashURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google4.reportMalwareMistakeURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google4.reportPhishMistakeURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google4.reportURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.google4.updateURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.mozilla.gethashURL", ""^);
@echo user_pref^("browser.safebrowsing.provider.mozilla.lastupdatetime", ""^);
@echo user_pref^("browser.safebrowsing.provider.mozilla.nextupdatetime", ""^);
@echo user_pref^("browser.safebrowsing.provider.mozilla.updateURL", ""^);
@echo user_pref^("browser.safebrowsing.reportErrorURL", ""^);
@echo user_pref^("browser.safebrowsing.reportGenericURL", ""^);
@echo user_pref^("browser.safebrowsing.reportMalwareErrorURL", ""^);
@echo user_pref^("browser.safebrowsing.reportMalwareMistakeURL", ""^);
@echo user_pref^("browser.safebrowsing.reportMalwareURL", ""^);
@echo user_pref^("browser.safebrowsing.reportPhishMistakeURL", ""^);
@echo user_pref^("browser.safebrowsing.reportPhishURL", ""^);
@echo user_pref^("browser.safebrowsing.reportURL", ""^);
@echo user_pref^("browser.safebrowsing.updateURL", ""^);
@echo user_pref^("browser.search.geoip.url", ""^);
@echo user_pref^("browser.search.geoSpecificDefaults", false^);
@echo user_pref^("browser.search.geoSpecificDefaults.url", ""^);
@echo user_pref^("browser.search.reset.enabled", false^);
@echo user_pref^("browser.search.reset.whitelist", ""^);
@echo user_pref^("browser.search.serpEventTelemetryCategorization.enabled", false^);
@echo user_pref^("browser.search.suggest.enabled", false^);
@echo user_pref^("browser.search.suggest.enabled.private", false^);
@echo user_pref^("browser.search.update", false^);
@echo user_pref^("browser.search.update.log", false^);
@echo user_pref^("browser.search.widget.inNavBar", true^);
@echo user_pref^("browser.selfsupport.url", ""^);
@echo user_pref^("browser.sessionhistory.max_entries", 128^);
@echo user_pref^("browser.sessionstore.max_tabs_undo", 32^);
@echo user_pref^("browser.sessionstore.restore_tabs_lazily", false^);
@echo user_pref^("browser.sessionstore.restore_on_demand", false^);
@echo user_pref^("browser.sessionstore.warnOnQuit", true^);
@echo user_pref^("browser.shell.checkDefaultBrowser", false^);
@echo user_pref^("browser.shopping.experience2023.active", false^);
@echo user_pref^("browser.shopping.experience2023.ads.enabled", false^);
@echo user_pref^("browser.shopping.experience2023.ads.userEnabled", false^);
@echo user_pref^("browser.shopping.experience2023.enabled", false^);
@echo user_pref^("browser.shopping.experience2023.optedIn", 0^);
@echo user_pref^("browser.shopping.experience2023.survey.enabled", false^);
@echo user_pref^("browser.shopping.experience2023.survey.hasSeen", false^);
@echo user_pref^("browser.shopping.experience2023.survey.pdpVisits", 0^);
@echo user_pref^("browser.slowStartup.averageTime", 0^);
@echo user_pref^("browser.slowStartup.notificationDisabled", true^);
@echo user_pref^("browser.slowStartup.samples", 0^);
@echo user_pref^("browser.startup.blankWindow", false^);
@echo user_pref^("browser.startup.homepage", "about:newtab"^);
@echo user_pref^("browser.startup.homepage_override.mstone", "ignore"^);
@echo user_pref^("browser.startup.page", 3^);
@echo user_pref^("browser.suppress_first_window_animation", false^);
@echo user_pref^("browser.tabs.animate", false^);
@echo user_pref^("browser.tabs.closeWindowWithLastTab", false^);
@echo user_pref^("browser.tabs.crashReporting.sendReport", false^);
@echo user_pref^("browser.tabs.firefox-view", false^);
@echo user_pref^("browser.tabs.loadInBackground", false^);
@echo user_pref^("browser.tabs.maxOpenBeforeWarn", 10^);
@echo user_pref^("browser.tabs.remote.autostart", false^);
@echo user_pref^("browser.tabs.remote.autostart.2", false^);
@echo user_pref^("browser.tabs.tabMinWidth", 40^);
@echo user_pref^("browser.taskbar.previews.enable", true^);
@echo user_pref^("browser.theme.dark-private-windows", false^);
@echo user_pref^("browser.topsites.contile.enabled", false^);
@echo user_pref^("browser.toolbarbuttons.introduced.pocket-button", true^);
@echo user_pref^("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"urlbar-container\",\"save-to-pocket-button\",\"downloads-button\",\"fxa-toolbar-menu-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\",\"TabsToolbar\",\"toolbar-menubar\"],\"currentVersion\":19,\"newElementCount\":3}"^);
@echo user_pref^("browser.uidensity", 1^);
@echo user_pref^("browser.uitour.enabled", false^);
@echo user_pref^("browser.urlbar.formatting.enabled", false^);
@echo user_pref^("browser.urlbar.oneOffSearches", false^);
@echo user_pref^("browser.urlbar.searchSuggestionsChoice", false^);
@echo user_pref^("browser.urlbar.suggest.searches", false^);
@echo user_pref^("browser.urlbar.suggest.topsites", false^);
@echo user_pref^("browser.urlbar.trimURLs", false^);
@echo user_pref^("browser.urlbar.update1", false^);
@echo user_pref^("browser.vpn_promo.enabled", false^);
@echo user_pref^("camera.control.face_detection.enabled", false^);
@echo user_pref^("canvas.capturestream.enabled", false^);
@echo user_pref^("captivedetect.canonicalURL", ""^);
@echo user_pref^("datareporting.healthreport.about.reportUrl", ""^);
@echo user_pref^("datareporting.healthreport.about.reportUrlUnified", ""^);
@echo user_pref^("datareporting.healthreport.documentServerURI", ""^);
@echo user_pref^("datareporting.healthreport.infoURL", ""^);
@echo user_pref^("datareporting.healthreport.service.enabled", false^);
@echo user_pref^("datareporting.healthreport.service.firstRun", true^);
@echo user_pref^("datareporting.healthreport.uploadEnabled", false^);
@echo user_pref^("datareporting.policy.dataSubmissionEnabled", false^);
@echo user_pref^("datareporting.policy.dataSubmissionEnabled.v2", false^);
@echo user_pref^("datareporting.policy.firstRunURL", ""^);
@echo user_pref^("default-browser-agent.enabled", false^);
@echo user_pref^("device.sensors.enabled", false^);
@echo user_pref^("device.sensors.motion.enabled", false^);
@echo user_pref^("device.sensors.orientation.enabled", false^);
@echo user_pref^("devtools.enabled", true^);
@echo user_pref^("devtools.onboarding.telemetry.logged", false^);
@echo user_pref^("distribution.iniFile.exists.value", true^);
@echo user_pref^("distribution.mozilla-EMEfree.bookmarksProcessed", true^);
@echo user_pref^("dom.allow_scripts_to_close_windows", false^);
@echo user_pref^("dom.battery.enabled", false^);
@echo // user_pref^("dom.caches.enabled", false^);
@echo user_pref^("dom.disable_beforeunload", true^);
@echo user_pref^("dom.disable_window_flip", false^);
@echo user_pref^("dom.disable_window_move_resize", true^);
@echo user_pref^("dom.disable_window_open_feature.close", true^);
@echo user_pref^("dom.disable_window_open_feature.location", false^);
@echo user_pref^("dom.disable_window_open_feature.minimizable", true^);
@echo user_pref^("dom.disable_window_open_feature.personalbar", true^);
@echo user_pref^("dom.disable_window_open_feature.titlebar", true^);
@echo user_pref^("dom.disable_window_status_change", false^);
@echo // user_pref^("dom.enable_performance", false^);
@echo user_pref^("dom.enable_performance_navigation_timing", false^);
@echo user_pref^("dom.enable_performance_observer", false^);
@echo user_pref^("dom.enable_resource_timing", false^);
@echo user_pref^("dom.enable_user_timing", false^);
@echo user_pref^("dom.event.clipboardevents.enabled", false^);
@echo user_pref^("dom.gamepad.enabled", false^);
@echo user_pref^("dom.gamepad.extensions.enabled", false^);
@echo user_pref^("dom.gamepad.non_standard_events.enabled", false^);
@echo user_pref^("dom.idle-observers-api.enabled", false^);
@echo user_pref^("dom.indexedDB.logging.details", false^);
@echo user_pref^("dom.indexedDB.logging.enabled", false^);
@echo user_pref^("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false^);
@echo user_pref^("dom.ipc.plugins.reportCrashURL", false^);
@echo user_pref^("dom.ipc.processCount", 1^);
@echo user_pref^("dom.keyboardevent.dispatch_during_composition", false^);
@echo user_pref^("dom.mozApps.used", true^);
@echo user_pref^("dom.netinfo.enabled", false^);
@echo user_pref^("dom.network.enabled", false^);
@echo user_pref^("dom.private-attribution.submission.enabled", false^);
@echo user_pref^("dom.push.connection.enabled", false^);
@echo user_pref^("dom.push.enabled", false^);
@echo user_pref^("dom.push.serverURL", ""^);
@echo // user_pref^("dom.security.https_first", true^);
@echo user_pref^("dom.security.https_only_mode", true^);
@echo user_pref^("dom.security.https_only_mode_ever_enabled", true^);
@echo user_pref^("dom.security.https_only_mode_ever_enabled_pbm", true^);
@echo user_pref^("dom.serviceWorkers.enabled", false^);
@echo user_pref^("dom.sms.enabled", false^);
@echo user_pref^("dom.vibrator.enabled", false^);
@echo user_pref^("dom.vr.enabled", false^);
@echo user_pref^("dom.vr.oculus.enabled", false^);
@echo user_pref^("dom.vr.oculus.invisible.enabled", false^);
@echo user_pref^("dom.vr.poseprediction.enabled", false^);
@echo user_pref^("dom.vr.require-gesture", false^);
@echo user_pref^("dom.w3c_touch_events.enabled", 0^);
@echo user_pref^("dom.webaudio.enabled", false^);
@echo user_pref^("dom.webnotifications.enabled", false^);
@echo user_pref^("dom.webnotifications.serviceworker.enabled", false^);
@echo user_pref^("experiments.activeExperiment", false^);
@echo user_pref^("experiments.enabled", false^);
@echo user_pref^("experiments.manifest.uri", ""^);
@echo user_pref^("experiments.supported", false^);
@echo user_pref^("extensions.abuseReport.enabled", false^);
@echo user_pref^("extensions.blocklist.enabled", false^);
@echo user_pref^("extensions.blocklist.pingCountTotal", 2^);
@echo user_pref^("extensions.blocklist.pingCountVersion", 0^);
@echo user_pref^("extensions.bootstrappedAddons", "{}"^);
@echo user_pref^("extensions.databaseSchema", 16^);
@echo user_pref^("extensions.e10sBlockedByAddons", true^);
@echo user_pref^("extensions.e10sBlocksEnabling", true^);
@echo user_pref^("extensions.enabledAddons", "SimpleX%%40White.Theme:3.0"^);
@echo user_pref^("extensions.formautofill.addresses.enabled", false^);
@echo user_pref^("extensions.formautofill.creditCards.enabled", false^);
@echo user_pref^("extensions.formautofill.heuristics.enabled", false^);
@echo user_pref^("extensions.getAddons.cache.enabled", false^);
@echo user_pref^("extensions.getAddons.databaseSchema", 5^);
@echo user_pref^("extensions.getAddons.showPane", false^);
@echo user_pref^("extensions.htmlaboutaddons.discover.enabled", false^);
@echo user_pref^("extensions.htmlaboutaddons.recommendations.enabled", false^);
@echo user_pref^("extensions.manifestV3.enabled", false^);
@echo user_pref^("extensions.pendingOperations", false^);
@echo user_pref^("extensions.pocket.api", ""^);
@echo user_pref^("extensions.pocket.enabled", false^);
@echo user_pref^("extensions.pocket.oAuthConsumerKey", ""^);
@echo user_pref^("extensions.pocket.site", ""^);
@echo user_pref^("extensions.privatebrowsing.notification", true^);
@echo user_pref^("extensions.ui.dictionary.hidden", true^);
@echo user_pref^("extensions.ui.locale.hidden", true^);
@echo user_pref^("extensions.unifiedExtensions.enabled", false^);
@echo user_pref^("extensions.webcompat-reporter.enabled", false^);
@echo user_pref^("extensions.webcompat-reporter.newIssueEndpoint", ""^);
@echo user_pref^("extensions.webservice.discoverURL", ""^);
@echo user_pref^("findbar.highlightAll", true^);
@echo user_pref^("font.internaluseonly.changed", false^);
@echo user_pref^("font.size.fixed.x-cyrillic", 13^);
@echo user_pref^("font.size.monospace.x-cyrillic", 13^);
@echo user_pref^("full-screen-api.warning.delay", 250^);
@echo user_pref^("full-screen-api.warning.timeout", 1500^);
@echo user_pref^("general.skins.selectedSkin", "simplewhitex"^);
@echo user_pref^("general.smoothScroll", false^);
@echo user_pref^("general.warnOnAboutConfig", false^);
@echo user_pref^("geo.enabled", false^);
@echo user_pref^("geo.provider.ms-windows-location", false^);
@echo user_pref^("geo.wifi.logging.enabled", false^);
@echo user_pref^("geo.wifi.uri", ""^);
@echo user_pref^("gfx.canvas.skiagl.dynamic-cache", false^);
@echo user_pref^("gfx.direct3d.last_used_feature_level_idx", 0^);
@echo user_pref^("gfx.work-around-driver-bugs", false^);
@echo user_pref^("identity.fxaccounts.enabled", false^);
@echo user_pref^("intl.charsetmenu.browser.cache", "UTF-8"^);
@echo user_pref^("javascript.options.shared_memory", true^);
@echo user_pref^("keyword.enabled", false^);
@echo user_pref^("layers.acceleration.force-enabled", true^);
@echo user_pref^("layers.deaa.enabled", false^);
@echo user_pref^("layers.geometry.opengl.enabled", false^);
@echo user_pref^("layers.mlgpu.sanity-test-failed", false^);
@echo user_pref^("lightweightThemes.update.enabled", false^);
@echo user_pref^("loop.enabled", false^);
@echo user_pref^("loop.feedback.formURL", ""^);
@echo user_pref^("loop.gettingStarted.url", ""^);
@echo user_pref^("media.autoplay.enabled", false^);
@echo user_pref^("media.block-autoplay-until-in-foreground", true^);
@echo user_pref^("media.block-play-until-visible", true^);
@echo user_pref^("media.decoder-doctor.new-issue-endpoint", ""^);
@echo user_pref^("media.eme.apiVisible", false^);
@echo user_pref^("media.eme.enabled", false^);
@echo user_pref^("media.getusermedia.aec_enabled", false^);
@echo user_pref^("media.getusermedia.noise_enabled", false^);
@echo user_pref^("media.getusermedia.screensharing.allowed_domains", ""^);
@echo user_pref^("media.getusermedia.screensharing.enabled", false^);
@echo user_pref^("media.gmp-eme-adobe.enabled", false^);
@echo user_pref^("media.hardware-video-decoding.enabled", true^);
@echo user_pref^("media.hardware-video-decoding.failed", false^);
@echo user_pref^("media.hardware-video-decoding.force-enabled", true^);
@echo user_pref^("media.navigator.enabled", false^);
@echo user_pref^("media.navigator.permission.disabled", true^);
@echo user_pref^("media.navigator.video.enabled", false^);
@echo user_pref^("media.ondevicechange.enabled", false^);
@echo user_pref^("media.peerconnection.enabled", false^);
@echo user_pref^("media.peerconnection.ice.default_address_only", true^);
@echo user_pref^("media.peerconnection.ice.no_host", true^);
@echo user_pref^("media.peerconnection.ice.relay_only", true^);
@echo user_pref^("media.peerconnection.ice.tcp", false^);
@echo user_pref^("media.peerconnection.identity.enabled", false^);
@echo user_pref^("media.peerconnection.identity.timeout", 1^);
@echo user_pref^("media.peerconnection.turn.disable", true^);
@echo user_pref^("media.peerconnection.use_document_iceservers", false^);
@echo user_pref^("media.peerconnection.video.enabled", false^);
@echo user_pref^("media.video_stats.enabled", false^);
@echo user_pref^("media.videocontrols.picture-in-picture.improved-video-controls.enabled", true^);
@echo user_pref^("media.webspeech.recognition.enable", false^);
@echo user_pref^("media.webspeech.recognition.force_enable", false^);
@echo user_pref^("media.webspeech.synth.enabled", false^);
@echo user_pref^("media.wmf.deblacklisting-for-telemetry-in-gpu-process", false^);
@echo user_pref^("mousewheel.default.delta_multiplier_y", 450^);
@echo // user_pref^("mousewheel.min_line_scroll_amount", 5^);
@echo user_pref^("network.allow-experiments", false^);
@echo user_pref^("network.captive-portal-service.enabled", false^);
@echo user_pref^("network.captive-portal-service.maxInterval", 0^);
@echo user_pref^("network.cookie.cookieBehavior", 1^);
@echo user_pref^("network.cookie.lifetimePolicy", 2^);
@echo user_pref^("network.cookie.prefsMigrated", true^);
@echo user_pref^("network.cookie.thirdparty.sessionOnly", true^);
@echo // user_pref^("network.dns.disableIPv6", true^);
@echo user_pref^("network.dns.disablePrefetch", true^);
@echo user_pref^("network.dns.disablePrefetchFromHTTPS", true^);
@echo user_pref^("network.http.altsvc.enabled", false^);
@echo user_pref^("network.http.altsvc.oe", false^);
@echo user_pref^("network.http.speculative-parallel-limit", 0^);
@echo user_pref^("network.dns.offline-localhost", true^);
@echo user_pref^("network.predictor.enabled", false^);
@echo user_pref^("network.predictor.enable-prefetch", false^);
@echo user_pref^("network.prefetch-next", false^);
@echo user_pref^("network.security.esni.enabled", true^);
@echo user_pref^("network.tcp.tcp_fastopen_enable", true^);
@echo user_pref^("network.trr.mode", 1^);
@echo user_pref^("nglayout.initialpaint.delay", 5^);
@echo user_pref^("pdfjs.enabledCache.state", false^);
@echo user_pref^("pdfjs.enableScripting", false^);
@echo user_pref^("pdfjs.migrationVersion", 2^);
@echo user_pref^("pdfjs.previousHandler.alwaysAskBeforeHandling", true^);
@echo user_pref^("pdfjs.previousHandler.preferredAction", 4^);
@echo user_pref^("plugin.disable_full_page_plugin_for_types", "application/pdf"^);
@echo user_pref^("plugin.importedState", true^);
@echo user_pref^("pref.browser.homepage.disable_button.bookmark_page", false^);
@echo user_pref^("pref.browser.homepage.disable_button.current_page", false^);
@echo user_pref^("pref.browser.homepage.disable_button.restore_default", false^);
@echo user_pref^("pref.downloads.disable_button.edit_actions", false^);
@echo user_pref^("pref.general.disable_button.default_browser", false^);
@echo user_pref^("pref.privacy.disable_button.cookie_exceptions", false^);
@echo user_pref^("pref.privacy.disable_button.view_cookies", false^);
@echo user_pref^("pref.privacy.disable_button.view_passwords", false^);
@echo user_pref^("privacy.donottrackheader.enabled", true^);
@echo user_pref^("privacy.firstparty.isolate", false^);
@echo user_pref^("privacy.history.custom", true^);
@echo user_pref^("privacy.reduceTimerPrecision", true^);
@echo user_pref^("privacy.resistFingerprinting", false^);
@echo user_pref^("privacy.sanitize.migrateFx3Prefs", true^);
@echo user_pref^("privacy.socialtracking.block_cookies.enabled", true^);
@echo user_pref^("privacy.trackingprotection.enabled", true^);
@echo user_pref^("reader.parse-on-load.enabled", false^);
@echo user_pref^("readinglist.scheduler.enabled", false^);
@echo user_pref^("readinglist.server", ""^);
@echo user_pref^("security.app_menu.recordEventTelemetry", false^);
@echo user_pref^("security.certerrors.recordEventTelemetry", false^);
@echo user_pref^("security.identityblock.show_extended_validation", true^);
@echo user_pref^("security.identitypopup.recordEventTelemetry", false^);
@echo user_pref^("security.insecure_connection_text.enabled", false^);
@echo user_pref^("security.protectionspopup.recordEventTelemetry", false^);
@echo user_pref^("security.secure_connection_icon_color_gray", false^);
@echo user_pref^("security.ssl.errorReporting.enabled", false^);
@echo user_pref^("security.ssl.errorReporting.url", ""^);
@echo user_pref^("services.sync.clients.lastSync", "0"^);
@echo user_pref^("services.sync.clients.lastSyncLocal", "0"^);
@echo user_pref^("services.sync.declinedEngines", ""^);
@echo user_pref^("services.sync.enabled", false^);
@echo user_pref^("services.sync.globalScore", 0^);
@echo user_pref^("services.sync.migrated", true^);
@echo user_pref^("services.sync.nextSync", 0^);
@echo user_pref^("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored", false^);
@echo user_pref^("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites", false^);
@echo user_pref^("services.sync.tabs.lastSync", "0"^);
@echo user_pref^("services.sync.tabs.lastSyncLocal", "0"^);
@echo user_pref^("signon.autofillForms", false^);
@echo user_pref^("signon.firefoxRelay.feature", "disabled"^);
@echo user_pref^("signon.generation.enabled", false^);
@echo user_pref^("signon.management.page.breach-alerts.enabled", false^);
@echo user_pref^("signon.rememberSignons", false^);
@echo user_pref^("social.directories", ""^);
@echo user_pref^("social.remote-install.enabled", false^);
@echo user_pref^("social.share.activationPanelEnabled", false^);
@echo user_pref^("social.shareDirectory", ""^);
@echo user_pref^("social.toast-notifications.enabled", false^);
@echo user_pref^("social.whitelist", ""^);
@echo user_pref^("toolkit.cosmeticAnimations.enabled", false^);
@echo user_pref^("toolkit.coverage.endpoint.base", ""^);
@echo user_pref^("toolkit.crashreporter.infoURL", ""^);
@echo user_pref^("toolkit.datacollection.infoURL", ""^);
@echo user_pref^("toolkit.legacyUserProfileCustomizations.stylesheets", true^);
@echo user_pref^("toolkit.shopping.ohttpConfigURL", ""^);
@echo user_pref^("toolkit.shopping.ohttpRelayURL", ""^);
@echo user_pref^("toolkit.telemetry.archive.enabled", false^);
@echo user_pref^("toolkit.telemetry.bhrPing.enabled", false^);
@echo user_pref^("toolkit.telemetry.cachedClientID", ""^);
@echo user_pref^("toolkit.telemetry.enabled", false^);
@echo user_pref^("toolkit.telemetry.firstShutdownPing.enabled", false^);
@echo user_pref^("toolkit.telemetry.hybridContent.enabled", false^);
@echo user_pref^("toolkit.telemetry.newProfilePing.enabled", false^);
@echo user_pref^("toolkit.telemetry.optoutSample", false^);
@echo user_pref^("toolkit.telemetry.pioneer-new-studies-available", false^);
@echo user_pref^("toolkit.telemetry.reportingpolicy.firstRun", false^);
@echo user_pref^("toolkit.telemetry.server", ""^);
@echo user_pref^("toolkit.telemetry.shutdownPingSender.enabled", false^);
@echo user_pref^("toolkit.telemetry.shutdownPingSender.enabledFirstSession", false^);
@echo user_pref^("toolkit.telemetry.unified", false^);
@echo user_pref^("toolkit.telemetry.updatePing.enabled", false^);
@echo user_pref^("toolkit.telemetry.unifiedIsOptIn", false^);
@echo user_pref^("toolkit.zoomManager.zoomValues", ".25,.3,.5,.67,.75,.8,.9,1,1.1,1.25,1.33,1.5,1.7,2,2.4,3,4,5"^);
@echo user_pref^("ui.prefersReducedMotion", 1^);
@echo user_pref^("xpinstall.whitelist.add", ""^);
@echo user_pref^("xpinstall.whitelist.add.180", ""^);
@echo user_pref^("xul.panel-animations.enabled", false^);
@echo+
@echo user_pref^("ui.useOverlayScrollbars", 1^);
@echo user_pref^("widget.gtk.overlay-scrollbars.enabled", true^);
@echo user_pref^("widget.non-native-theme.scrollbar.style", 5^);
@echo user_pref^("widget.windows.overlay-scrollbars.enabled", true^);
@echo //  user_pref^("widget.non-native-theme.scrollbar.style", 5^);  //  Default = 0 ; macOs = 1 ; GTK = 2 ; Android = 3 ; W10 = 4 ; W11 = 5
)>"r3dfoxPortable\portable\prefs.js"

(@echo @cd core&@echo @start r3dfox.exe -no-remote -profile ..\portable %%*)>"r3dfoxPortable\r3dfoxPortable.bat"

@md "r3dfoxPortable\portable\extensions"
@if exist "curl.exe" @GOTO CURLDL2
@if exist "%SystemRoot%\SYSTEM32\curl.exe" @GOTO CURLDL2
@echo Downloading with powershell . . .
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/enhanced-h264ify/', 'r3dfoxPortable\portable\extensions\{9a41dee2-b924-4161-a971-7fb35c053a4a}.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/hls-stream-detector/', 'r3dfoxPortable\portable\extensions\@m3u8link.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/noscript/', 'r3dfoxPortable\portable\extensions\{73a6fe31-595d-460b-a920-fcc0f8843232}.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/save-page-we/', 'r3dfoxPortable\portable\extensions\savepage-we@DW-dev.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/send-to-my-phone-qr-code-gener/', 'r3dfoxPortable\portable\extensions\jid1-dgAsBwQgc4SQBk@jetpack.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/smart-rss-reader/', 'r3dfoxPortable\portable\extensions\smart-rss@mozilla.firefox.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/', 'r3dfoxPortable\portable\extensions\uBlock0@raymondhill.net.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/', 'r3dfoxPortable\portable\extensions\sponsorBlocker@ajay.app.xpi')"
@GOTO XPIDONE
:CURLDL2
@echo Downloading with CURL . . .
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/enhanced-h264ify/" -o "r3dfoxPortable\portable\extensions\{9a41dee2-b924-4161-a971-7fb35c053a4a}.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/hls-stream-detector/" -o "r3dfoxPortable\portable\extensions\@m3u8link.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/noscript/" -o "r3dfoxPortable\portable\extensions\{73a6fe31-595d-460b-a920-fcc0f8843232}.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/save-page-we/" -o "r3dfoxPortable\portable\extensions\savepage-we@DW-dev.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/send-to-my-phone-qr-code-gener/" -o "r3dfoxPortable\portable\extensions\jid1-dgAsBwQgc4SQBk@jetpack.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/smart-rss-reader/" -o "r3dfoxPortable\portable\extensions\smart-rss@mozilla.firefox.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/" -o "r3dfoxPortable\portable\extensions\uBlock0@raymondhill.net.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/" -o "r3dfoxPortable\portable\extensions\sponsorBlocker@ajay.app.xpi"
:XPIDONE

@echo.
@echo Done!
@pause