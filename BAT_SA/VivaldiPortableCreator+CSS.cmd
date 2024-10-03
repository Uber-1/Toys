@echo off
@title Vivaldi downloader + configer ^| ver.4.2 [03.10.2024]
@cd /d "%~dp0"
@echo.
@echo Release channel:
@echo {R} Release / {S} Snapshot
@choice /c RS
@set ViChan=%ERRORLEVEL%
@set ERRORLEVEL=
@md "VivaldiPortable"
@curl.exe -RLO# "https://www.7-zip.org/a/7zr.exe"
@if not exist "7zr.exe" (@color 0C &@echo DOWNLOAD ERROR: "7zr.exe" &@pause > nul &@exit)

@if /i "%ViChan%"=="2" (@GOTO DLSNA)
@for /f eol^=-^ tokens^=1-26^ delims^=^?^" %%a in ('@curl.exe -lsL "https://vivaldi.com/download" ^| 2^>nul FINDSTR /IRC:"vivaldi-versions.js"') do (@set VIVJS=%%c)
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://vivaldi.com/wp-content/vivaldi-versions.js?%VIVJS%" ^| 2^>nul FINDSTR /IRC:"version"') do (@set VIVER=%%d)
@echo.Version: "%VIVER%"
@curl.exe -RLO# "https://downloads.vivaldi.com/stable/Vivaldi.%VIVER%.exe"
@curl.exe -RLO# "https://downloads.vivaldi.com/stable/Vivaldi.%VIVER%.x64.exe"
@GOTO DLFIN
:DLSNA
@for /f "eol=- tokens=1-26 delims=.:" %%a in ('@curl.exe -lsL "https://vivaldi.com/feed/" ^| 2^>nul FINDSTR /IRC:"Vivaldi.*.exe"') do (@if NOT DEFINED VIVER (@set VIVER=%%e.%%f.%%g.%%h))
@echo.Version: "%VIVER%"
@curl.exe -RLO# "https://downloads.vivaldi.com/snapshot/Vivaldi.%VIVER%.exe"
@curl.exe -RLO# "https://downloads.vivaldi.com/snapshot/Vivaldi.%VIVER%.x64.exe"
:DLFIN
@if not exist "Vivaldi*.exe" (@color 0C &@echo DOWNLOAD ERROR: "Vivaldi*.exe" &@pause > nul &@exit)

@"7zr.exe" x -t7z -bso0 "Vivaldi.%VIVER%.exe"   	&&@rename "vivaldi.7z" vivaldi32.7z 	&&@"7zr.exe" rn -bso0 "vivaldi32.7z" Vivaldi-bin VivaldiPortable\Vivaldi-bin-win32
@"7zr.exe" x -t7z -bso0 "Vivaldi.%VIVER%.x64.exe" 	&&@rename "vivaldi.7z" vivaldi64.7z 	&&@"7zr.exe" rn -bso0 "vivaldi64.7z" Vivaldi-bin VivaldiPortable\Vivaldi-bin-win64
@"7zr.exe" x -bso0 "vivaldi*.7z" -xr!*default-bookmarks -xr!*sd_thumbnails* -xr!*favicons* -xr!VisualElements
@move VivaldiPortable\Vivaldi-bin-win32\update_notifier.exe VivaldiPortable\Vivaldi-bin-win32\update_notifier.exe.~disabled
@move VivaldiPortable\Vivaldi-bin-win64\update_notifier.exe VivaldiPortable\Vivaldi-bin-win64\update_notifier.exe.~disabled
@del /f /q "Vivaldi.%VIVER%*.exe" "vivaldi*.7z" "7zr.exe"
@CURL -RLO# "https://github.com/czyt/vivaldi_plus/releases/latest/download/windows_x86.zip" &&@tar -xf windows_x86.zip &&@move version.dll "VivaldiPortable\Vivaldi-bin-win32\version.dll"
@CURL -RLO# "https://github.com/czyt/vivaldi_plus/releases/latest/download/windows_x64.zip" &&@tar -xf windows_x64.zip &&@move version.dll "VivaldiPortable\Vivaldi-bin-win64\version.dll"
@del /f /q "windows_x64.zip" "windows_x86.zip"
(@echo [dir_setting]&@echo data=%%app%%/../Data&@echo cache=nul&@echo [features]&@echo right_click_close_tab=0)>"VivaldiPortable\Vivaldi-bin-win32\config.ini"
(@echo [dir_setting]&@echo data=%%app%%/../Data&@echo cache=nul&@echo [features]&@echo right_click_close_tab=0)>"VivaldiPortable\Vivaldi-bin-win64\config.ini"

@type NUL>"VivaldiPortable\Vivaldi-bin-win32\stp.viv"
@type NUL>"VivaldiPortable\Vivaldi-bin-win64\stp.viv"
@md VivaldiPortable\Data\Default
@set cr_loca1={"background_mode":{"enabled":false},"browser":{"enabled_labs_experiments":["ignore-gpu-blocklist","smooth-scrolling@2","ui-enable-shared-image-cache-for-gpu@2"]},"hardware_acceleration_mode_previous":true,"profile":{"last_used":"Default"}}
@set cr_pref1={"NewTabPage":{"DisabledModules":["dummy","dummy2"],"ModulesVisible":false},"alternate_error_pages":{"backup":false},"autocomplete":{"retention_policy_last_version":108},"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_only_on_ntp":true},"browser":{"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"window_placement":{"bottom":720,"left":64,"maximized":true,"right":1200,"top":32}},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_a_ping":false,"enable_do_not_track":true,"extensions":{"alerts":{"initialized":true},"chrome_url_overrides":{},"commands":{},"ui":{"developer_mode":true}},"first_run_tabs":[],"https_only_mode_enabled":true,"import_bookmarks":false,"import_history":false,"import_home_page":false,"import_search_engine":false,"invalidation":{"per_sender_topics_to_handler":{"1013309121859":{},"8181035976":{}}},"media":{"engagement":{"schema_version":5}},"net":{"network_prediction_options":2},"ntp":{"num_personal_suggestions":0},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"plugins":{"plugins_list":[]},"profile":{"avatar_index":3,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"enable_quiet_permission_ui_enabling_method":{"notifications":1},"exceptions":{},"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":3,"managed_user_id":"","name":"","password_manager_enabled":false,"were_old_google_logins_removed":true},"safebrowsing":{"enabled":false,"event_timestamps":{}},"search":{"suggest_enabled":false},"settings":{"a11y":{"apply_page_colors_only_on_increased_contrast":true}},"signin":{"allowed":false},"spellcheck":{"dictionaries":["ru"],"dictionary":""},"translate":{"enabled":false},"unified_consent":{"migration_state":10},"vivaldi":{"address_bar":{"extensions":{"hidden_extensions":[],"render_in_dropdown":true,"show_all_toggle":true},"highlight_base_domain":true,"omnibox":{"show_top_sites":false},"search":{"display":1,"show_favicon":true,"suggest_enabled":false},"show_full_url":true,"show_profile":false,"show_qr_generator":true,"visible":true},"appearance":{"css_ui_mods_directory":"CSS","density":false,"range_buttons":true},"bookmarks":{"language":"uk-UA","panel":{"sorting":{"sortField":"manually","sortOrder":1}}},"chained_commands":{"command_list":[],"deleted_command_list":[],"version":1},"downloads":{"start_automatically":false},"experiments":["css_mods","custom_buttons"],"homepage":"vivaldi://startpage","homepage_cache":"","incognito":{"show_intro":false},"language_at_install":"ru","menu":{"compact":true,"display":0,"icon_type":1},"panels":{"web":{"elements":[],"removed_elements":[{"id":"WEBPANEL_949d4873-deed-4168-b306-92d1848687a5","mobileMode":true,"title":"Social","url":"https://social.vivaldi.net/","zoom":1},{"id":"WEBPANEL_ckmam0bsw00002y5xoafpww5i","mobileMode":true,"origin":"bundle","resizable":false,"title":"Help","url":"https://help.vivaldi.com/","width":-1,"zoom":1},{"id":"WEBPANEL_ckn7fhhqx0000hc2roo8jshm4","mobileMode":true,"origin":"bundle","resizable":false,"title":"Wiki","url":"https://wikipedia.org","width":-1,"zoom":1}]},"window_defaults":{"barVisible":false,"panelVisible":false,"selectedPanel":"PanelDownloads","width":310}},"popups":{"show_in_tab":true},"privacy":{"adverse_ad_block":{},"google_component_extensions":{"hangout_services":false}},"settings":{"in_tab":true,"mono_icons":false},"show_extensions_banner":false,"startpage":{"navigation":2,"speed_dial":{"add_button_visible":false,"display_search":false,"game_button_show":false,"privacy_stats_show":false}},"startup":{"check_is_default":false,"has_seen_feature":1},"status_bar":{"display":2,"minimized":1},"system":{"desktop_theme_color":0,"show_exit_confirmation_dialog":false},"tabs":{"active_min_size":30,"cycle_by_recent_order":false,"dim_hibernated":true,"horizontal_scrolling":false,"show_synced_tabs_button":false,"show_trash_can":true,"stacking":{"allow_dnd":true,"dnd_delay":50,"mode":3,"open_accordions":[]}},"theme":{"dim_blurred":false,"schedule":{"enabled":0,"o_s":{"dark":"Vivaldi2","light":"Vivaldi5"}},"simple_scrollbar":false,"use_animation":false},"themes":{"current":"Vivaldi5"},"toolbars":{"navigation":["PanelToggle","Back","Forward","Reload","AddressField","UpdateButton","Extensions"],"panel":["PanelBookmarks","PanelReadingList","PanelDownloads","PanelHistory","PanelNotes","PanelTranslate","PanelWindow","PanelSession","PanelMail","PanelCalendar","PanelTasks","PanelFeeds","PanelContacts","PanelWeb","FlexibleSpacer","Settings"]},"translate":{"enabled":false},"webpages":{"smooth_scrolling":{"enabled":false},"tab_zoom":{"enabled":false}},"welcome":{"read_pages":["welcome_four","import_data","tracker_and_ad","personalize","tabs","touch"],"seen_pages":["welcome_four","import_data","tracker_and_ad","personalize","tabs","touch"]},"windows":{"show_window_close_confirmation_dialog":false},"workspaces":{"button":{"show_in_tabbar":true,"show_name":true},"enabled":false}}}
(@echo %cr_loca1%)>"VivaldiPortable\Data\Local State"
(@echo %cr_pref1%)>"VivaldiPortable\Data\Default\Preferences"

@md "VivaldiPortable\Vivaldi-bin-win32\%VIVER%\CSS\"
@md "VivaldiPortable\Vivaldi-bin-win64\%VIVER%\CSS\"
(
@echo /* высота 30px */
@echo #browser:not^(.tabs-top^) .vivaldi { height:30px; padding:0; }
@echo .toolbar-mainbar .toolbar-extensions ^> .button-toolbar ^> button { height:30px; }
@echo .toolbar-mainbar ^> .button-toolbar ^> button { height:30px; }
@echo.
@echo /* поднимаем главную панель вверх */
@echo #header, #main { position:unset; }
@echo .toolbar-mainbar:not^(.toolbar-wrap^):not^(.toolbar-editor section.dialog-preview .toolbar^):not^(.toolbar.toolbar-droptarget.toolbar-mainbar.toolbar-mailbar.toolbar-large^) { position:absolute; top:unset; left:35px !important; height:30px; /* background:var^(--colorAccentBg^) !important; */ border:none !important; transform:translateY^(-30px^); }
@echo.
@echo /* расположение иконок расширений, минимально 173 = 138 ^(упр.окном^) + 35 ^(каждое расш.^) */
@echo #main ^> div.mainbar ^> div ^> div.toolbar-extensions { position:absolute !important; transform:translate^(-100%%, 0^); /* background-color:var^(--colorAccentBg^) !important; */ transition:background-color 0.7s ease-out; left:calc^(100vw - 173px^) !important; height:30px !important; right:unset !important; top:0px; border-radius:var^(--radiusHalf^)!important; }
@echo .toolbar-mainbar .toolbar-extensions { background-color:transparent; }
@echo .toolbar-mainbar .toolbar-extensions:after, .toolbar-mainbar:after { display:none !important; }
@echo.
@echo /* расположение вкладок, их свойства */
@echo #tabs-container:not^(.none^).top { padding-left:calc^(31vw + 173px + 35px^) !important; padding-right:173px !important; padding-top:0px !important; margin-top:0px; min-height:30px; transition:0.3s; }
@echo .tab-position .tab { display:flex; flex:1 1 100%%; flex-flow:column; overflow:hidden; font-size:11px; -webkit-user-select:none; -webkit-user-drag:element; }
@echo.
@echo /* расположение основной панели с адресной строкой */
@echo .win.normal .toolbar-mainbar { left:unset; right:unset; border-radius:var^(--radiusHalf^)!important; }
@echo .UrlBar-AddressField { width:31vw !important; top:0px !important; }
@echo.
@echo /* убрать лишние элеенты */
@echo .UrlBar-PrivateWindowIndicator { font-size:0; padding:0 6px 0 6px; }
@echo .tabbar-workspace-button .button-title { font-size:0px; margin:0 0px; }
@echo.
@echo /* фикс позиции клавиш упр.окном */
@echo .normal .window-buttongroup { height:30px !important; width:unset !important; top:0px !important; align-items:center !important; }
@echo .maximized .window-buttongroup { height:unset !important; width:unset !important; top:0px !important; }
@echo.
@echo /* исправление шрифтов в интерфейсе браузера */
@echo #browser, #browser + div, #browser + div + div, #browser button, #browser input, #browser select, #browser textarea, .info { font-family:Arial,Tahoma,'MS Sans Serif',system-ui,sans-serif !important; font-weight:400; font-size:11px; line-height:1.0; text-shadow:transparent 0px 0px 0px, rgba^(0,0,0,0.25^) 0px 0px 0px !important; }
@echo.
@echo /* фикс позиции таб бара по высоте */
@echo .normal #tabs-tabbar-container.top { padding-top:0px !important; }
@echo .normal:not^(.horizontal-menu^) #tabs-tabbar-container.top { padding:0px 0 0 0 !important; }
@echo.
@echo /* фикс позиции элементов в оконном режиме */
@echo .vivaldi { margin-top:0px !important; }
@echo .tabs-top.address-top#browser.win:not^(.fullscreen, .disable-titlebar^) #header { min-height: calc^(30px / var^(--uiZoomLevel^) ^); }
@echo.
@echo /* фикс лишнего пикселя высоты внизу панели */
@echo .address-top .mainbar { border-bottom-width:0px; } 
)>"VivaldiPortable\Vivaldi-bin-win32\%VIVER%\CSS\custom.css"
@copy "VivaldiPortable\Vivaldi-bin-win32\%VIVER%\CSS\custom.css" "VivaldiPortable\Vivaldi-bin-win64\%VIVER%\CSS\custom.css"

(@echo @start Vivaldi.exe --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --disable-background-networking --disable-component-update --no-default-browser-check)>"VivaldiPortable\Vivaldi-bin-win32\VivaldiLauncher.bat"
(@echo @start Vivaldi.exe --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --disable-background-networking --disable-component-update --no-default-browser-check)>"VivaldiPortable\Vivaldi-bin-win64\VivaldiLauncher.bat"

@echo Done!
@pause > nul