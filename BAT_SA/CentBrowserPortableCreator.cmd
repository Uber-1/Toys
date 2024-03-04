@echo off
@title CentBrowser downloader + configer ^| ver.1.1 [02.03.2024]
@cd /d "%~dp0"
@if /i "%1"=="VO" (@color 0b &@echo MANUAL Version Override!)

@echo.
@echo Release channel:
@echo {R} Release / {B} Beta
@choice /c RB
@set CentBrowserChannel=%ERRORLEVEL%
@set ERRORLEVEL=

@echo.
@echo.Download . . .
@if not exist "7zr.exe" @powershell -Command "(New-Object Net.WebClient).DownloadFile('http://www.7-zip.org/a/7zr.exe', '7zr.exe')"
@if not exist "7zr.exe" (@color 0C &@echo DOWNLOAD ERROR: "7zr.exe" &@pause > nul &@exit)

@if /i "%CentBrowserChannel%"=="2" (@GOTO GetBeta)
@powershell -Command "(New-Object Net.WebClient).DownloadFile('http://static.centbrowser.com/win_stable', 'folder.htm')"
@for /f eol^=-^ tokens^=1-26^ delims^=^/^" %%a in ('@type folder.htm ^| 2^>nul  FINDSTR /IRC:"href..5"') do (if "%%b" NEQ "" @set CentBrowserVersion=%%b)
@del /f /q folder.htm
@echo Version %CentBrowserVersion%
@if /i "%1"=="VO"  @set CentBrowserVersion=5.0.1002.354
@powershell -Command "(New-Object Net.WebClient).DownloadFile('http://static.centbrowser.com/win_stable/%CentBrowserVersion%/centbrowser_%CentBrowserVersion%.exe', '32.exec')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('http://static.centbrowser.com/win_stable/%CentBrowserVersion%/centbrowser_%CentBrowserVersion%_x64.exe', '64.exec')"
@GOTO GetReady
:GetBeta
@powershell -Command "(New-Object Net.WebClient).DownloadFile('http://static.centbrowser.com/win_beta/', 'folder.htm')"
@for /f eol^=-^ tokens^=1-26^ delims^=^/^" %%a in ('@type folder.htm ^| 2^>nul  FINDSTR /IRC:"href..5"') do (if "%%b" NEQ "" @set CentBrowserVersion=%%b)
@del /f /q folder.htm
@echo Version %CentBrowserVersion%
@if /i "%1"=="VO"  @set CentBrowserVersion=5.1.1130.26
@powershell -Command "(New-Object Net.WebClient).DownloadFile('http://static.centbrowser.com/win_beta/%CentBrowserVersion%/centbrowser_%CentBrowserVersion%.exe', '32.exec')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('http://static.centbrowser.com/win_beta/%CentBrowserVersion%/centbrowser_%CentBrowserVersion%_x64.exe', '64.exec')"
:GetReady

@echo.
@echo.Unpack . . .
@set ExtactExcList=-xr!*bookmarks*.html -xr!*Installer* -xr!af.pak -xr!am.pak -xr!ar.pak -xr!ar-XB.pak -xr!as.pak -xr!az.pak -xr!bg.pak -xr!bn.pak -xr!bs.pak -xr!ca.pak -xr!ca-Es-VALENCIA.pak -xr!cs.pak -xr!cy.pak -xr!da.pak -xr!de.pak -xr!el.pak -xr!en-GB.pak -xr!en-XA.pak -xr!es.pak -xr!es-419.pak -xr!et.pak -xr!eu.pak -xr!fa.pak -xr!fi.pak -xr!fil.pak -xr!fr.pak -xr!fr-CA.pak -xr!ga.pak -xr!gd.pak -xr!gl.pak -xr!gu.pak -xr!he.pak -xr!hi.pak -xr!hr.pak -xr!hu.pak -xr!id.pak -xr!is.pak -xr!it.pak -xr!ja.pak -xr!ka.pak -xr!kk.pak -xr!km.pak -xr!kn.pak -xr!ko.pak -xr!kok.pak -xr!lb.pak -xr!lo.pak -xr!lt.pak -xr!lv.pak -xr!mi.pak -xr!mk.pak -xr!ml.pak -xr!mr.pak -xr!ms.pak -xr!mt.pak -xr!nb.pak -xr!ne.pak -xr!nl.pak -xr!nn.pak -xr!or.pak -xr!pa.pak -xr!pt-BR.pak -xr!pt-PT.pak -xr!qu.pak -xr!ro.pak -xr!sk.pak -xr!sl.pak -xr!sq.pak -xr!sr.pak -xr!sr-Cyrl-BA.pak -xr!sr-Latn-RS.pak -xr!sw.pak -xr!sv.pak -xr!ta.pak -xr!te.pak -xr!th.pak -xr!tr.pak -xr!tt.pak -xr!ug.pak -xr!ur.pak -xr!vi.pak -xr!zh-CN.pak -xr!zh-TW.pak
@7zr.exe e -bso0 -t# -aoa "32.exec" -o"temp32" *.7z &&@7zr.exe e -bso0 -t7z -aoa "temp32\*.7z" -o"temp32" &&@7zr.exe rn -bso0 "temp32\chrome.7z" Chrome-bin CentBrowser-win32 &&@7zr.exe x -bso0 -t7z -aoa "temp32\chrome.7z" -o"." %ExtactExcList% &&@type NUL>"CentBrowser-win32\%CentBrowserVersion%\cbportable" &&@rd /q /s "temp32"
@7zr.exe e -bso0 -t# -aoa "64.exec" -o"temp64" *.7z &&@7zr.exe e -bso0 -t7z -aoa "temp64\*.7z" -o"temp64" &&@7zr.exe rn -bso0 "temp64\chrome.7z" Chrome-bin CentBrowser-win64 &&@7zr.exe x -bso0 -t7z -aoa "temp64\chrome.7z" -o"." %ExtactExcList% &&@type NUL>"CentBrowser-win64\%CentBrowserVersion%\cbportable" &&@rd /q /s "temp64"
@del /f /q 32.exec 64.exec

@echo.
@echo.Config . . .
@set CentSwitches=--user-data-dir="User Data" --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --disable-background-networking --disable-component-update --no-default-browser-check --cb-compact-ui --cb-disable-user-statistics
@set cr_loca1={"background_mode":{"enabled":false},"browser":{"enabled_labs_experiments":["disable-direct-write","ignore-gpu-blocklist","smooth-scrolling@2","turn-off-streaming-media-caching@1","turn-off-streaming-media-caching-always@1","turn-off-streaming-media-caching-on-battery@1"]},"cent":{"browser_muted":false,"enable_auto_update":false,"enable_auto_update_pepper_flash":false,"enable_custom_css":false,"ignore_system_dpi":false,"min_tab_width":110,"search_engine_tags":{"tag_360":"","tag_baidu":"","tag_bing":"","tag_sogou":"","tag_yahoo":"","tag_yandex_ru":""},"set_min_tab_width":false,"show_mute_toggle_button":true,"single_extension_process":true,"tab_shape":1},"custom_cache_directory":{"enabled":false},"hardware_acceleration_mode_previous":true,"profile":{"last_used":"Default"}}
@set cr_pref1={"NewTabPage":{"ModulesVisible":false},"account_id_migration_state":2,"alternate_error_pages":{"enabled":false},"apps":{"shortcuts_have_been_created":true},"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false,"profile_use_dates_fixed":true},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_reading_list":false},"browser":{"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"show_home_button":true,"window_placement":{"bottom":720,"left":64,"maximized":false,"right":1200,"top":32}},"cent":{"alert_when_download_complete":false,"auto_bookmarks_menu":false,"bookmark_column_width":250,"bookmark_show_icon_only":false,"default_downloader":113627,"display_embedded_bookmarks_in_new_tab":true,"hide_tab_close_button":false,"ntp_default_search_engine_id":"id_ntp_se_google","ntp_mp_did_update":true,"ntp_mp_list":[],"ntp_show_most_popular":true,"ntp_show_most_visited":true,"ntp_shown_page":2490370,"open_popup_window_in_tab":true,"open_recommended_on_startup":false,"show_fullscreen_warning":true,"show_qrcode_button":true,"switch_tab_by_mouse_wheel":false},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_do_not_track":true,"enhanced_bookmarks_enabled":0,"extensions":{"alerts":{"initialized":true},"ui":{"developer_mode":true}},"homepage":"","homepage_is_newtabpage":true,"media":{"engagement":{"schema_version":4}},"net":{"network_prediction_options":2},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"plugins":{"always_open_pdf_externally":false},"previews":{"litepage":{"user-needs-notification":false}},"profile":{"avatar_index":24,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":24,"managed_user_id":"","name":"","password_manager_enabled":false},"protection":{"macs":{"google":{"services":{"account_id":"E468FE57A2F5553C25BD19D77A99DD92903766768A0AF0A92650D1C4BFDC6AD6","last_account_id":"F6DFA696DA912BFBF912371729D09CB99DDAC3EE14C50AFBA23B354E27C5AB07","last_username":"AA21DEB8FE264CD834A66A99D89788BB35E0111A66AEB99270E9A1B2DF24EE6C","username":"92AAA0D6C01A210A9A0818656EC2FD99D6EB17BCD705C75BE11EA8710FFC3F5A"}},"homepage":"290766B31C35A5358B548691F7A772B99FB5477D4A98F59ED7089CBCADE71D39","homepage_is_newtabpage":"97C466CA8F557E8D8E215FF41E17B0B7C410A2DC72441FF55B3FBEE46456FB07","session":{"restore_on_startup":"6CD74A256DEAC23568CAC2DAF13A0885C01EEC5FAE1326DC6E4F6304E98205B4","startup_urls":"615E87B09F519BBE170E2604B413D505D762BB8512D36168BA735983B512A970"}}},"safebrowsing":{"enabled":false,"unhandled_sync_password_reuses":{}},"savefile":{"default_directory":"::{20D04FE0-3AEA-1069-A2D8-08002B30309D}","type":1},"search":{"suggest_enabled":false},"session":{"restore_on_startup":1,"restore_on_startup_migrated":true},"settings":{"privacy":{"drm_enabled":false}},"signin":{"AccountReconcilor":{"kDiceMigrationOnStartup2":true},"allowed":false,"allowed_on_next_startup":false},"token_service":{"dice_compatible":true},"translate":{"enabled":false},"translate_site_blacklist":[],"translate_site_blacklist_with_time":{},"translate_whitelists":{},"webkit":{"webprefs":{"encrypted_media_enabled":false}},"zerosuggest":{"cachedresults":""}}
(@echo+&@echo [StartupCommandLine]&@echo enabled=1&@echo switches=%CentSwitches%)>"CentBrowser-win32\cb_config.ini"
(@echo+&@echo [StartupCommandLine]&@echo enabled=1&@echo switches=%CentSwitches%)>"CentBrowser-win64\cb_config.ini"
@md "CentBrowser-win32\User Data\Default\"
@md "CentBrowser-win64\User Data\Default\"
(@echo %cr_loca1%)>"CentBrowser-win32\User Data\Local State"
(@echo %cr_pref1%)>"CentBrowser-win32\User Data\Default\Preferences"
(@echo %cr_loca1%)>"CentBrowser-win64\User Data\Local State"
(@echo %cr_pref1%)>"CentBrowser-win64\User Data\Default\Preferences"

@echo Done!
@pause