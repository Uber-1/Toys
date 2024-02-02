@echo off
@title Iron downloader + configer ^| ver.1.0.1 [16.10.2023] ^| %PROCESSOR_ARCHITECTURE%
@cd /d "%~dp0"
@md Iron
@cd Iron

@if "%PROCESSOR_ARCHITECTURE%" NEQ "AMD64" (@set "DefBitIR=IronPortable"&@set "DefBitsCD=32") else (@set "DefBitIR=IronPortable64"&@set "DefBitsCD=64")
@echo Download, unpack...
@curl -RLO# "https://www.rarlab.com/rar/unrarw32.exe"
@unrarw32.exe -s -o-
@del /f /q /s license.txt unrarw32.exe > NUL
@curl -RL# "https://www.srware.net/downloads/%DefBitIR%.exe" -o "%DefBitIR%.rar"
@UnRAR.exe x -o+ -c- -idcdn "%DefBitIR%.rar"  -x*Bookmarks -x*7za.dll -x*howto_update.txt -x*Iron_Backup_Config*.exe -x*license* -x*icon.txt -x*\Profile\* -x*master_preferences -x*\locales\a*.pak -x*\locales\b*.pak -x*\locales\ca.pak -x*\locales\cs.pak -x*\locales\d*.pak -x*\locales\e?.pak -x*\locales\en-GB.pak -x*\locales\en-XA.pak -x*\locales\es*.pak -x*\locales\f*.pak -x*\locales\g*.pak -x*\locales\h*.pak -x*\locales\i*.pak -x*\locales\j*.pak -x*\locales\k*.pak -x*\locales\l*.pak -x*\locales\m*.pak -x*\locales\n*.pak -x*\locales\o*.pak -x*\locales\pt*.pak -x*\locales\q*.pak -x*\locales\ro.pak -x*\locales\s*.pak -x*\locales\t*.pak -x*\locales\ur.pak -x*\locales\v*.pak -x*\locales\w*.pak -x*\locales\z*.pak
@del /f /q /s UnRAR.exe "%DefBitIR%.rar"  > NUL
@curl -RL# "https://github.com/Bush2021/chrome_plus/raw/main/setdll/chrome++%DefBitsCD%.dll" -o "%DefBitIR%\Iron\version.dll"
@curl -RL# "https://github.com/Bush2021/chrome_plus/raw/main/setdll/chrome++.ini" -o "%DefBitIR%\Iron\chrome++.ini"

@echo Config...
@md "%DefBitIR%\Profile\Default\"
@set cr_masp1={"distribution":{"alternate_shortcut_text":false,"chrome_shortcut_icon_index":0,"create_all_shortcuts":true,"do_not_create_desktop_shortcut":true,"do_not_create_quick_launch_shortcut":true,"do_not_create_taskbar_shortcut":true,"do_not_launch_chrome":true,"do_not_register_for_update_launch":true,"import_bookmarks":false,"import_history":false,"import_home_page":false,"import_search_engine":false,"make_chrome_default":false,"make_chrome_default_for_user":false,"show_welcome_page":false,"skip_first_run_ui":true,"system_level":false,"verbose_logging":false},"first_run_tabs":[],"homepage":"chrome://chrome-urls","homepage_is_newtabpage":false,"safebrowsing":{"enabled":false},"session":{"restore_on_startup":1},"alternate_error_pages":{"enabled":false},"NewTabPage":{"DisabledModules":["dummy","dummy2"],"ModulesVisible":false},"account_id_migration_state":2,"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_only_on_ntp":true,"show_reading_list":false},"browser":{"show_home_button":true,"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"window_placement":{"bottom":720,"left":64,"maximized":true,"right":1200,"top":32}},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_do_not_track":true,"extensions":{"alerts":{"initialized":true},"ui":{"developer_mode":true}},"media":{"engagement":{"schema_version":4}},"net":{"network_prediction_options":2},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"profile":{"avatar_index":24,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":24,"managed_user_id":"","name":"","password_manager_enabled":false},"search":{"suggest_enabled":false}}
@set cr_loca1={"background_mode":{"enabled":false},"browser":{"enabled_labs_experiments":["ignore-gpu-blocklist","smooth-scrolling@2"]},"hardware_acceleration_mode_previous":true,"profile":{"last_used":"Default"}}
(@echo %cr_masp1%)>"%DefBitIR%\Iron\master_preferences"
(@echo %cr_loca1%)>"%DefBitIR%\Profile\Local State"

@echo IronPortable.ini...
(@echo --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --no-default-browser-check)>"%DefBitIR%\IronPortable.ini"
(@echo @cd Iron &@echo @start Chrome.exe --user-data-dir=..\Profile --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --no-default-browser-check)>"%DefBitIR%\ChromeLauncher.bat"

@echo Done!
@pause