@echo off
@title Ungoogled Chromium downloader + configer ^| ver.2.0 [20.10.2023] ^| %PROCESSOR_ARCHITECTURE%
@cd /d "%~dp0"

@echo.
@echo Release channel:
@echo {M} macchrome / {U} ungoogled-software
@choice /c MU
@set UngCrChan=%ERRORLEVEL%
@set ERRORLEVEL=
@echo.
@echo Download...
@if /i "%UngCrChan%"=="1"  (@GOTO UngCrChan-macchrome-winchrome)
@if /i "%UngCrChan%"=="2"  (@GOTO UngCrChan-ungoogled-software)

:UngCrChan-macchrome-winchrome
@for /f eol^=-^ tokens^=1-26^ delims^=^<^>^" %%a in ('@curl.exe -lsL "https://github.com/macchrome/winchrome/releases/latest" ^| @FINDSTR /IRC:"href.*ungoogled-chromium.*Win64.7z"') do (@set DefVerUngCr=%%b)
@echo Link: %DefVerUngCr%
@curl.exe -RLO# "%DefVerUngCr%"
@curl.exe -RLO# "https://www.7-zip.org/a/7zr.exe"
@FOR /F "tokens=1" %%i in ('dir "ungoogled-chromium*Win64.7z" /b') do (@set DefVerUngCrFile=%%i)
@set UngFolderName=%DefVerUngCrFile:.7z=%
@"7zr.exe" x -bso0 -aoa "%DefVerUngCrFile%" -xr!Extensions -xr!VisualElements
@del /f /q "7zr.exe" "%DefVerUngCrFile%"
@GOTO UngCrChan-CONFIG

:UngCrChan-ungoogled-software
@for /f eol^=-^ tokens^=1-26^ delims^=/^<^>^" %%a in ('@curl.exe -lsL "https://github.com/ungoogled-software/ungoogled-chromium-windows/releases" ^| @FINDSTR /IRC:"ungoogled-chromium-windows/releases/tag"') do (@if NOT DEFINED DefVerUngCr (@set DefVerUngCr=%%k))
@if "%PROCESSOR_ARCHITECTURE%" NEQ "AMD64" (@set DefBitsUngCr=x86) else (@set DefBitsUngCr=x64)
@curl.exe -RLO# "https://github.com/ungoogled-software/ungoogled-chromium-windows/releases/download/%DefVerUngCr%/ungoogled-chromium_%DefVerUngCr%_windows_%DefBitsUngCr%.zip"
@tar -xf "ungoogled-chromium_%DefVerUngCr%_windows_%DefBitsUngCr%.zip"
@del /f /q "ungoogled-chromium_%DefVerUngCr%_windows_%DefBitsUngCr%.zip"
@set UngFolderName=ungoogled-chromium_%DefVerUngCr%_windows

:UngCrChan-CONFIG
@echo.
@echo Config...
@md "%UngFolderName%\UserData\Default\"
@set cr_masp1={"distribution":{"alternate_shortcut_text":false,"chrome_shortcut_icon_index":0,"create_all_shortcuts":true,"do_not_create_desktop_shortcut":true,"do_not_create_quick_launch_shortcut":true,"do_not_create_taskbar_shortcut":true,"do_not_launch_chrome":true,"do_not_register_for_update_launch":true,"import_bookmarks":false,"import_history":false,"import_home_page":false,"import_search_engine":false,"make_chrome_default":false,"make_chrome_default_for_user":false,"show_welcome_page":false,"skip_first_run_ui":true,"system_level":false,"verbose_logging":false},"first_run_tabs":[],"homepage":"chrome://chrome-urls","homepage_is_newtabpage":false,"safebrowsing":{"enabled":false},"session":{"restore_on_startup":1},"alternate_error_pages":{"enabled":false},"NewTabPage":{"DisabledModules":["dummy","dummy2"],"ModulesVisible":false},"account_id_migration_state":2,"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_only_on_ntp":true,"show_reading_list":false},"browser":{"show_home_button":true,"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"window_placement":{"bottom":720,"left":64,"maximized":true,"right":1200,"top":32}},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_do_not_track":true,"extensions":{"alerts":{"initialized":true},"ui":{"developer_mode":true}},"media":{"engagement":{"schema_version":4}},"net":{"network_prediction_options":2},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"profile":{"avatar_index":24,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":24,"managed_user_id":"","name":"","password_manager_enabled":false},"search":{"suggest_enabled":false}}
@set cr_loca1={"background_mode":{"enabled":false},"browser":{"enabled_labs_experiments":["close-window-with-last-tab@1","disable-encryption","disable-machine-id","extension-mime-request-handling@2","hide-sidepanel-button","ignore-gpu-blocklist","popups-to-tabs","read-anything@2","remove-tabsearch-button","show-avatar-button@3","side-search@2","smooth-scrolling@2"]},"hardware_acceleration_mode_previous":true,"profile":{"last_used":"Default"}}
@set cr_pref1={"NewTabPage":{"DisabledModules":["dummy","dummy2"],"ModulesVisible":false},"account_id_migration_state":2,"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_reading_list":false},"browser":{"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"window_placement":{"bottom":720,"left":64,"maximized":false,"right":1200,"top":32}},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_do_not_track":true,"extensions":{"alerts":{"initialized":true},"ui":{"developer_mode":true}},"media":{"engagement":{"schema_version":4}},"net":{"network_prediction_options":2},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"profile":{"avatar_index":24,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":24,"managed_user_id":"","name":"","password_manager_enabled":false},"safebrowsing":{"enabled":false,"unhandled_sync_password_reuses":{}},"savefile":{"default_directory":"::{20D04FE0-3AEA-1069-A2D8-08002B30309D}"},"search":{"suggest_enabled":false},"zerosuggest":{"cachedresults":""}}
(@echo %cr_masp1%)>"%UngFolderName%\master_preferences"
(@echo %cr_loca1%)>"%UngFolderName%\UserData\Local State"
(@echo %cr_pref1%)>"%UngFolderName%\UserData\Default\Preferences"
(@echo @start Chrome.exe --user-data-dir=UserData --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --disable-background-networking --disable-component-update --no-default-browser-check --disable-machine-id --disable-encryption --popups-to-tabs --close-window-with-last-tab=never --show-avatar-button=never)>"%UngFolderName%\\UngoogledChromiumLauncher.bat"
@type NUL>"%UngFolderName%\UserData\First Run"

@echo.
@echo Bookmarks...
@set cr_bookm={"roots":{"bookmark_bar":{"children":[{"name":"Chrome URLs","type":"url","url":"chrome://chrome-urls/"},{"name":"","type":"url","url":"chrome://settings/content/zoomLevels"},{"name":"","type":"url","url":"chrome://downloads/"},{"name":"Webstore","type":"url","url":"https://chrome.google.com/webstore/category/extensions"},{"name":"uBO","type":"url","url":"https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm"},{"name":"NS","type":"url","url":"https://chrome.google.com/webstore/detail/noscript/doojmbjmlfjjnbmnoijecmcbfeoakpjm"},{"name":"EH","type":"url","url":"https://chrome.google.com/webstore/detail/enhanced-h264ify/omkfmpieigblcllmkgbflkikinpkodlk"},{"name":"FRE","type":"url","url":"https://chrome.google.com/webstore/detail/font-rendering-enhancer/hmbmmdjlcdediglgfcdkhinjdelkiock"},{"name":"SBY","type":"url","url":"https://chrome.google.com/webstore/detail/sponsorblock-for-youtube/mnjggcdmjocbbbhaepdhchncahnbgone"},{"name":"GetCRX","type":"url","url":"javascript:window.open%%28\"https%%3A//clients2.google.com/service/update2/crx%%3Fresponse%%3Dredirect%%26prodversion%%3D100.0.0.0%%26acceptformat%%3Dcrx3%%26x%%3Did%%253D\" + window.location.href.match%%28/%%28%%5Ba-p%%5D%%7B32%%7D%%29/%%29%%5B1%%5D + \"\" + \"%%2526uc\"%%29"},{"name":"Translate","type":"url","url":"javascript:(function(){var url=%%22https://translate.google.com/translate?sl=auto&tl=ru&u=%%22+location.href;window.location.assign(url);})();"},{"name":"Google","type":"url","url":"https://www.google.com/"},{"name":"ChromiumChecker","type":"url","url":"https://chromiumchecker.com/"}],"name":"Bookmarks","type":"folder"},"other":{},"synced":{}},"version":1}
(@echo %cr_bookm%)>"%UngFolderName%\UserData\Default\Bookmarks"

@if not exist "%UngFolderName%\chrome.exe" (@color 0C&@echo "%UngFolderName%\chrome.exe" NOT FOUND! &@pause > nul &@exit)
@if exist "UngoogledChromiumPortable.old" (@rd /q /s "UngoogledChromiumPortable.old")
@if exist "UngoogledChromiumPortable" (@rename "UngoogledChromiumPortable" "UngoogledChromiumPortable.old")
@rename "%UngFolderName%" "UngoogledChromiumPortable" > NUL
@if exist "UngoogledChromiumPortable.old" (@xcopy "UngoogledChromiumPortable.old\UserData\*.*" "UngoogledChromiumPortable\UserData\*.*" /Q /E /I /G /H /R /K /Y)

@echo Done!
@pause > nul