@echo off
@title Supermium downloader + configer + selfcleaner ^| ver.5.1 [06.03.2024]
@cd /d "%~dp0"

@echo.
@echo Download...
@CURL -RLO# "https://www.7-zip.org/a/7zr.exe"

@for /f eol^=-^ tokens^=1-26^ delims^=^/^" %%a in ('@curl.exe -lsL "https://api.github.com/repos/win32ss/supermium/releases/latest" ^| @FINDSTR /IRC:"browser_download_url.*_32.*exe"') do (@set "SuTAG=%%j"&@set "SuEXE32=%%k")
@CURL -RL# "https://github.com/win32ss/supermium/releases/download/%SuTAG%/%SuEXE32%" -o "%SuEXE32%.exec"
@for /f eol^=-^ tokens^=1-26^ delims^=^/^" %%a in ('@curl.exe -lsL "https://api.github.com/repos/win32ss/supermium/releases/latest" ^| @FINDSTR /IRC:"browser_download_url.*_64.*exe"') do (@set "SuTAG=%%j"&@set "SuEXE64=%%k")
@CURL -RL# "https://github.com/win32ss/supermium/releases/download/%SuTAG%/%SuEXE64%" -o "%SuEXE64%.exec"

@echo.
@echo Unpack...
@7zr.exe rn -t7z -bso0 -aoa "%SuEXE32%.exec" Supermium Supermium-win32
@7zr.exe rn -t7z -bso0 -aoa "%SuEXE64%.exec" Supermium Supermium-win64
@for /f "tokens=1-3 delims=\= " %%a in ('@"7zr.exe" l -slt "%SuEXE32%.exec" ^| 2^>nul  FINDSTR /IRC:"chrome.exe"') do if not "%%b"=="" @set "PathName32=%%b"& @set "ExecName32=%%c"
@for /f "tokens=1-3 delims=\= " %%a in ('@"7zr.exe" l -slt "%SuEXE64%.exec" ^| 2^>nul  FINDSTR /IRC:"chrome.exe"') do if not "%%b"=="" @set "PathName64=%%b"& @set "ExecName64=%%c"
@echo 32 bit . . . %PathName32% %ExecName32%
@echo 64 bit . . . %PathName64% %ExecName64%
@if /i "%PathName32%" EQU "Supermium-win32"  (@set UnpPath=.) else (@set UnpPath=Supermium-win32)
@if /i "%PathName64%" EQU "Supermium-win64"  (@set UnpPath=.) else (@set UnpPath=Supermium-win64)
@if exist "Supermium-win32" (@rename "Supermium-win32" "Supermium-win32~old%random%%random%%random%")
@if exist "Supermium-win64" (@rename "Supermium-win64" "Supermium-win64~old%random%%random%%random%")
@if exist "Supermium"       (@rename "Supermium" "Supermium~old%random%%random%%random%")
@set ExtactExcList=-xr!af.pak -xr!am.pak -xr!ar.pak -xr!ar-XB.pak -xr!as.pak -xr!az.pak -xr!bg.pak -xr!bn.pak -xr!bs.pak -xr!ca.pak -xr!ca-Es-VALENCIA.pak -xr!cs.pak -xr!cy.pak -xr!da.pak -xr!de.pak -xr!el.pak -xr!en-GB.pak -xr!en-XA.pak -xr!es.pak -xr!es-419.pak -xr!et.pak -xr!eu.pak -xr!fa.pak -xr!fi.pak -xr!fil.pak -xr!fr.pak -xr!fr-CA.pak -xr!ga.pak -xr!gd.pak -xr!gl.pak -xr!gu.pak -xr!he.pak -xr!hi.pak -xr!hr.pak -xr!hu.pak -xr!id.pak -xr!is.pak -xr!it.pak -xr!ja.pak -xr!ka.pak -xr!kk.pak -xr!km.pak -xr!kn.pak -xr!ko.pak -xr!kok.pak -xr!lb.pak -xr!lo.pak -xr!lt.pak -xr!lv.pak -xr!mi.pak -xr!mk.pak -xr!ml.pak -xr!mr.pak -xr!ms.pak -xr!mt.pak -xr!nb.pak -xr!ne.pak -xr!nl.pak -xr!nn.pak -xr!or.pak -xr!pa.pak -xr!pt-BR.pak -xr!pt-PT.pak -xr!qu.pak -xr!ro.pak -xr!sk.pak -xr!sl.pak -xr!sq.pak -xr!sr.pak -xr!sr-Cyrl-BA.pak -xr!sr-Latn-RS.pak -xr!sw.pak -xr!sv.pak -xr!ta.pak -xr!te.pak -xr!th.pak -xr!tr.pak -xr!tt.pak -xr!ug.pak -xr!ur.pak -xr!vi.pak -xr!zh-CN.pak -xr!zh-TW.pak
@7zr.exe x -t7z -bso0 -aoa "%SuEXE32%.exec" -o"%UnpPath%" -xr!*setup.exe -xr!*NotoEmoji.ttf %ExtactExcList%
@7zr.exe x -t7z -bso0 -aoa "%SuEXE64%.exec" -o"%UnpPath%" -xr!*setup.exe -xr!*NotoEmoji.ttf %ExtactExcList%
@del /q "7zr.exe" "%SuEXE32%.exec" "%SuEXE64%.exec" > NUL

@echo.
@echo Config...
@md "Data\Default\" > NUL
@set cr_masp1={"distribution":{"alternate_shortcut_text":false,"chrome_shortcut_icon_index":0,"create_all_shortcuts":true,"do_not_create_desktop_shortcut":true,"do_not_create_quick_launch_shortcut":true,"do_not_create_taskbar_shortcut":true,"do_not_launch_chrome":true,"do_not_register_for_update_launch":true,"import_bookmarks":false,"import_history":false,"import_home_page":false,"import_search_engine":false,"make_chrome_default":false,"make_chrome_default_for_user":false,"show_welcome_page":false,"skip_first_run_ui":true,"system_level":false,"verbose_logging":false},"first_run_tabs":[],"homepage":"chrome://chrome-urls","homepage_is_newtabpage":false,"safebrowsing":{"enabled":false},"session":{"restore_on_startup":1},"alternate_error_pages":{"enabled":false},"NewTabPage":{"DisabledModules":["dummy","dummy2"],"ModulesVisible":false},"account_id_migration_state":2,"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_only_on_ntp":true,"show_reading_list":false},"browser":{"show_home_button":true,"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"window_placement":{"bottom":720,"left":64,"maximized":true,"right":1200,"top":32}},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_do_not_track":true,"extensions":{"alerts":{"initialized":true},"ui":{"developer_mode":true}},"media":{"engagement":{"schema_version":4}},"net":{"network_prediction_options":2},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"profile":{"avatar_index":24,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":24,"managed_user_id":"","name":"","password_manager_enabled":false},"search":{"suggest_enabled":false}}
@set cr_loca1={"background_mode":{"enabled":false},"browser":{"enabled_labs_experiments":["chrome-labs@3","compact-ui","custom-ntp","custom-tab-shapes@1","disable-encryption","disable-machine-id","disable-search-engine-collection","disable-sharing-hub","extension-mime-request-handling@2","hide-sidepanel-button","ignore-gpu-blocklist","override-new-tab-button-shape-default","override-tab-outline-default","popups-to-tabs","read-anything@2","remove-tabsearch-button","show-avatar-button@3","smooth-scrolling@2","transparent-tabs"],"enabled_labs_experiments_origin_lists":{"custom-ntp":"chrome://new-tab-page-third-party/"}},"hardware_acceleration_mode_previous":true,"profile":{"last_used":"Default"}}
@set cr_pref1={"NewTabPage":{"DisabledModules":["dummy","dummy2"],"ModulesVisible":false},"account_id_migration_state":2,"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_reading_list":false},"browser":{"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"window_placement":{"bottom":720,"left":64,"maximized":false,"right":1200,"top":32}},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_do_not_track":true,"extensions":{"alerts":{"initialized":true},"ui":{"developer_mode":true}},"media":{"engagement":{"schema_version":4}},"net":{"network_prediction_options":2},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"profile":{"avatar_index":24,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":24,"managed_user_id":"","name":"","password_manager_enabled":false},"safebrowsing":{"enabled":false,"unhandled_sync_password_reuses":{}},"savefile":{"default_directory":"::{20D04FE0-3AEA-1069-A2D8-08002B30309D}"},"search":{"suggest_enabled":false},"zerosuggest":{"cachedresults":""}}
(@echo %cr_masp1%)>"Supermium-win32\master_preferences"
(@echo %cr_masp1%)>"Supermium-win64\master_preferences"
@if exist "Data\Local State" @GOTO SkipUserData
(@echo %cr_loca1%)>"Data\Local State"
(@echo %cr_pref1%)>"Data\Default\Preferences"
@type NUL>"Data\First Run"
:SkipUserData
@SET cr_clpar=--disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --no-default-browser-check --disable-direct-write
(@echo @cd Supermium-win32 &@echo @start Chrome.exe --user-data-dir=..\Data %cr_clpar%)>"Supermium-Launcher-win32.bat"
(@echo @cd Supermium-win64 &@echo @start Chrome.exe --user-data-dir=..\Data %cr_clpar%)>"Supermium-Launcher-win64.bat"

@echo.
@echo Done!
@pause