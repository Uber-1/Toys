:: äéÑàêéÇäÄ: DOS/OEM cp866 !!!

@echo off
@title CatsXP downloader + configer + selfcleaner ^| ver.1.1 [18.09.2023] ^| %PROCESSOR_ARCHITECTURE%
@cd /d "%~dp0"

@if "%PROCESSOR_ARCHITECTURE%" NEQ "AMD64" (@set DefBitsCatsXP=x86) else (@set DefBitsCatsXP=x64)

@echo.
@echo Download...
@for /f eol^=-^ tokens^=1-26^ delims^=^.^ö^<^>^" %%a in ('@curl.exe -lsL "https://www.catsxp.com/" ^| @FINDSTR /IRC:"li.Kernel"') do (@set DefKerCatsXP=%%d)
@for /f eol^=-^ tokens^=1-26^ delims^=^ö^<^>^" %%a in ('@curl.exe -lsL "https://www.catsxp.com/" ^| @FINDSTR /IRC:"li.Ver"') do (@set DefVerCatsXP=%%d)
@echo "%DefBitsCatsXP%/catsxp_installer_%DefKerCatsXP%_%DefVerCatsXP:.=_%.exe"
@curl.exe -RLO# "https://www.7-zip.org/a/7zr.exe"
@curl.exe -RL# "https://download.catsxp.com/%DefBitsCatsXP%/catsxp_installer_%DefKerCatsXP%_%DefVerCatsXP:.=_%.exe" -o"cx.exec"

@echo.
@echo Unpack...
@7zr.exe x -t7z -bso0 -aoa "cx.exec" -o"." &&@7zr.exe rn -bso0 -aoa "chrome.7z" Chrome-bin CatsXP-win &&@7zr.exe x -bso0 -aoa chrome.7z -o"CatsXP" &&@del /f /q chrome.7z cx.exec 7zr.exe

@echo.
@echo Config sample...
@md "CatsXP\CatsXP-win\UserData\Default"
@set cr_masp1={"distribution":{"alternate_shortcut_text":false,"chrome_shortcut_icon_index":0,"create_all_shortcuts":true,"do_not_create_desktop_shortcut":true,"do_not_create_quick_launch_shortcut":true,"do_not_create_taskbar_shortcut":true,"do_not_launch_chrome":true,"do_not_register_for_update_launch":true,"import_bookmarks":false,"import_history":false,"import_home_page":false,"import_search_engine":false,"make_chrome_default":false,"make_chrome_default_for_user":false,"show_welcome_page":false,"skip_first_run_ui":true,"system_level":false,"verbose_logging":false},"first_run_tabs":[],"homepage":"chrome://chrome-urls","homepage_is_newtabpage":false,"safebrowsing":{"enabled":false},"session":{"restore_on_startup":1},"alternate_error_pages":{"enabled":false},"NewTabPage":{"DisabledModules":["dummy","dummy2"],"ModulesVisible":false},"account_id_migration_state":2,"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_only_on_ntp":true,"show_reading_list":false},"browser":{"show_home_button":true,"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"window_placement":{"bottom":720,"left":64,"maximized":true,"right":1200,"top":32}},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_do_not_track":true,"extensions":{"alerts":{"initialized":true},"ui":{"developer_mode":true}},"media":{"engagement":{"schema_version":4}},"net":{"network_prediction_options":2},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"profile":{"avatar_index":24,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":24,"managed_user_id":"","name":"","password_manager_enabled":false},"search":{"suggest_enabled":false}}
@set cr_loca1={"background_mode":{"enabled":false},"browser":{"enabled_labs_experiments":["disable-encryption","disable-machine-id","ignore-gpu-blocklist","smooth-scrolling@2"]},"hardware_acceleration_mode_previous":true,"profile":{"last_used":"Default"}}
(@echo %cr_masp1%)>"CatsXP\CatsXP-win\master_preferences"
(@echo %cr_loca1%)>"CatsXP\CatsXP-win\UserData\Local State"

@echo Config: StartupParm.txt ...
(
@echo --user-data-dir=./UserData
@echo --disable-gpu-shader-disk-cache
@echo --disk-cache-dir=nul
@echo --disk-cache-size=1
@echo --disable-background-networking
@echo --disable-component-update
@echo --no-default-browser-check
@echo --disable-machine-id
@echo --disable-encryption-win
)>"CatsXP\CatsXP-win\StartupParm.txt"

@echo.
@echo Done!
@pause > nul