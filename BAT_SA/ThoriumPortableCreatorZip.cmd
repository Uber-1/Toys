@echo off
@title Thorium downloader + configer ^| ver.1.0 [06.04.2024]
@cd /d "%~dp0"

@echo.
@echo Release channel:
@echo   {1} WIN32_SSE2 / {2} WIN32_SSE3 / {3} SSE3 / {4} SSE4 / {5} AVX / {6} AVX2
@choice /c 123456
@set ThoBuildID=%ERRORLEVEL%
@set ERRORLEVEL=
@if /i "%ThoBuildID%"=="1"  @SET ThoBuild=WIN32_SSE2
@if /i "%ThoBuildID%"=="2"  @SET ThoBuild=WIN32_SSE3
@if /i "%ThoBuildID%"=="3"  @SET ThoBuild=SSE3
@if /i "%ThoBuildID%"=="4"  @SET ThoBuild=SSE4
@if /i "%ThoBuildID%"=="5"  @SET ThoBuild=AVX
@if /i "%ThoBuildID%"=="6"  @SET ThoBuild=AVX2

@echo.
@echo Download... %ThoBuild%
@for /f eol^=-^ tokens^=1-26^ delims^=^/^" %%a in ('@curl.exe -lsL "https://api.github.com/repos/Alex313031/thorium-win7/releases/latest" ^| @FINDSTR /IRC:"browser_download_url.*Thorium_%ThoBuild%.*zip"') do (@set "ThTAG=%%j"&@set "ThZIP=%%k")
@CURL -RLO# "https://github.com/Alex313031/thorium-win7/releases/download/%ThTAG%/%ThZIP%"

@echo.
@echo Unpack...
@tar -xf "%ThZIP%"
@del /f /q /s THORIUM.BAT THORIUM_SHELL.BAT README.txt "%ThZIP%" chromedriver.exe  "a*.pak" "b*.pak" "ca.pak" "cs.pak" "d*.pak" "e?.pak" en-GB.pak en-XA.pak "es*.pak" "f*.pak" "g*.pak" "h*.pak" "i*.pak" "j*.pak" "k*.pak" "l*.pak" "m*.pak" "n*.pak" "o*.pak" "pt-BR.pak" "pt-PT.pak" "q*.pak" "ro.pak" "s*.pak" "t*.pak" "ur.pak" "v*.pak" "w*.pak" "z*.pak" > nul
@if exist "Thorium_%ThoBuild%.old" (@rd /q /s "Thorium_%ThoBuild%.old")
@if exist "Thorium_%ThoBuild%" (@rename "Thorium_%ThoBuild%" "Thorium_%ThoBuild%.old")
@rename "BIN" "Thorium_%ThoBuild%" > NUL

@echo.
@echo Config...
@md "USER_DATA\Default\" > NUL
@set cr_masp1={"distribution":{"alternate_shortcut_text":false,"chrome_shortcut_icon_index":0,"create_all_shortcuts":true,"do_not_create_desktop_shortcut":true,"do_not_create_quick_launch_shortcut":true,"do_not_create_taskbar_shortcut":true,"do_not_launch_chrome":true,"do_not_register_for_update_launch":true,"import_bookmarks":false,"import_history":false,"import_home_page":false,"import_search_engine":false,"make_chrome_default":false,"make_chrome_default_for_user":false,"show_welcome_page":false,"skip_first_run_ui":true,"system_level":false,"verbose_logging":false},"first_run_tabs":[],"homepage":"chrome://chrome-urls","homepage_is_newtabpage":false,"safebrowsing":{"enabled":false},"session":{"restore_on_startup":1},"alternate_error_pages":{"enabled":false},"NewTabPage":{"DisabledModules":["dummy","dummy2"],"ModulesVisible":false},"account_id_migration_state":2,"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_only_on_ntp":true,"show_reading_list":false},"browser":{"show_home_button":true,"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"window_placement":{"bottom":720,"left":64,"maximized":true,"right":1200,"top":32}},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_do_not_track":true,"extensions":{"alerts":{"initialized":true},"ui":{"developer_mode":true}},"media":{"engagement":{"schema_version":4}},"net":{"network_prediction_options":2},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"profile":{"avatar_index":24,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":24,"managed_user_id":"","name":"","password_manager_enabled":false},"search":{"suggest_enabled":false}}
@set cr_loca1={"background_mode":{"enabled":false},"browser":{"enabled_labs_experiments":["close-window-with-last-tab@1","custom-ntp","disable-encryption","disable-machine-id","extension-mime-request-handling@2","hide-sidepanel-button","ignore-gpu-blocklist","omnibox-gm3-steady-state-height@2","popups-to-tabs","read-anything@2","remove-tabsearch-button","show-avatar-button@3","side-search@2","smooth-scrolling@2"],"enabled_labs_experiments_origin_lists":{"custom-ntp":"chrome://new-tab-page-third-party/"}},"hardware_acceleration_mode_previous":true,"profile":{"last_used":"Default"}}
(@echo %cr_masp1%)>"Thorium_%ThoBuild%\initial_preferences"
(@echo %cr_loca1%)>"USER_DATA\Local State"
(@echo @start thorium.exe --user-data-dir=..\USER_DATA --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --disable-background-networking --disable-component-update --no-default-browser-check --disable-logging --disable-breakpad)>"Thorium_%ThoBuild%\ThoriumLauncher.bat"

@echo.
@echo Done!
@pause > nul