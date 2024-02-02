@echo off
@title Google Chrome downloader + configer ^| ver.4.0 [24.03.2023]
@cd /d "%~dp0"
@echo.
@echo Release channel:
@echo {S} stable / {B} beta / {D} dev / {C} canary
@choice /c SBDC
@set CrChan=%ERRORLEVEL%
@set ERRORLEVEL=
@md "GChromePortable"
@cd "GChromePortable"
@if /i "%CrChan%"=="1"  (@set CrChanAppid=8A69D345-D564-463C-AFF1-A69D9E530F96&@set CrChanName=stable)
@if /i "%CrChan%"=="2"  (@set CrChanAppid=8237E44A-0054-442C-B6B6-EA0509993955&@set CrChanName=beta)
@if /i "%CrChan%"=="3"  (@set CrChanAppid=401C381F-E0DE-4B85-8BD8-3F3F14FBDA57&@set CrChanName=dev)
@if /i "%CrChan%"=="4"  (@set CrChanAppid=4EA16AC7-FD5A-47C3-875B-DBF4A2008C20&@set CrChanName=canary&@set CrChanAP64=x64-canary)
(@echo ^<?xml version="1.0" encoding="UTF-8"?^> ^<request protocol="3.0" ismachine="1" installsource="ondemand" dedup="cr"^> ^<hw physmemory="4" sse="1" sse2="1" sse3="1" ssse3="1" sse41="1" sse42="1" avx="1"/^> ^<os platform="win" version="7.0" arch="x86"/^> ^<app appid="{%CrChanAppid%}" release_channel="%CrChanName%" ap=""^>^<updatecheck/^>^</app^> ^</request^> )>"in32.xml"
(@echo ^<?xml version="1.0" encoding="UTF-8"?^> ^<request protocol="3.0" ismachine="1" installsource="ondemand" dedup="cr"^> ^<hw physmemory="4" sse="1" sse2="1" sse3="1" ssse3="1" sse41="1" sse42="1" avx="1"/^> ^<os platform="win" version="7.0" arch="x64"/^> ^<app appid="{%CrChanAppid%}" release_channel="%CrChanName%" ap="%CrChanAP64%"^>^<updatecheck/^>^</app^> ^</request^> )>"in64.xml"
@FOR /F "eol=; tokens=1,2* delims= usebackq" %%i in (`@powershell -Command " Invoke-WebRequest -Uri 'https://tools.google.com/service/update2' -Method POST -ContentType 'text/xml' -InFile in32.xml -OutFile out32.xml ; (([xml](gc '.\out32.xml')).response.app.updatecheck|select @{n='DowloadLink';e={$_.urls.url.codebase[-1]+$_.manifest.packages.package.name}}).DowloadLink "`) do (@set Link32=%%i)
@FOR /F "eol=; tokens=1,2* delims= usebackq" %%i in (`@powershell -Command " Invoke-WebRequest -Uri 'https://tools.google.com/service/update2' -Method POST -ContentType 'text/xml' -InFile in64.xml -OutFile out64.xml ; (([xml](gc '.\out64.xml')).response.app.updatecheck|select @{n='DowloadLink';e={$_.urls.url.codebase[-1]+$_.manifest.packages.package.name}}).DowloadLink "`) do (@set Link64=%%i)
@del /f /q in32.xml in64.xml out32.xml out64.xml

(@echo Win32 %CrChanName%: %Link32%)>> chrome_links.txt
(@echo Win64 %CrChanName%: %Link64%)>> chrome_links.txt

@echo.
@echo Download...
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://google.com'); $wc.DownloadFile('%Link32%', 'GC32.exec')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://google.com'); $wc.DownloadFile('%Link64%', 'GC64.exec')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.7-zip.org/a/7zr.exe', '7zr.exe')"

@echo.
@echo Unpack...
@7zr.exe x -t7z -bso0 "GC32.exec" -o"." &&@rename chrome.7z chrome32.7z &&@7zr.exe rn -bso0 "chrome32.7z" Chrome-bin Chrome-win32
@7zr.exe x -t7z -bso0 "GC64.exec" -o"." &&@rename chrome.7z chrome64.7z &&@7zr.exe rn -bso0 "chrome64.7z" Chrome-bin Chrome-win64
@7zr.exe x -bso0 "chrome*.7z" -o"GChrome"
@del /f /q chrome32.7z chrome64.7z "GC32.exec" "GC64.exec" "7zr.exe"

@echo.
@echo version.dll...
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://github.com/jestxfot/Google-Chrome-Portable/releases/1.5.4.2'); $wc.DownloadFile('https://github.com/jestxfot/Google-Chrome-Portable/releases/download/1.5.4.2/version32.dll', 'GChrome\Chrome-win32\version.dll')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://github.com/jestxfot/Google-Chrome-Portable/releases/1.5.4.2'); $wc.DownloadFile('https://github.com/jestxfot/Google-Chrome-Portable/releases/download/1.5.4.2/version64.dll', 'GChrome\Chrome-win64\version.dll')"

@echo.
@echo Config...
@set CrExeDir=GChrome\
@set CrUsDa=Data
@set CrUsDaDef=%CrUsDa%\Default
@md "%CrExeDir%%CrUsDaDef%\"
@set cr_loca1={"background_mode":{"enabled":false},"browser":{"enabled_labs_experiments":["smooth-scrolling@2"]},"hardware_acceleration_mode_previous":true,"profile":{"last_used":"Default"}}
@set cr_pref1={"NewTabPage":{"DisabledModules":["dummy","dummy2"],"ModulesVisible":false},"account_id_migration_state":2,"autofill":{"credit_card_enabled":false,"enabled":false,"orphan_rows_removed":true,"profile_enabled":false},"bookmark_bar":{"show_apps_shortcut":false,"show_on_all_tabs":false,"show_reading_list":false},"browser":{"check_default_browser":false,"clear_data":{"browsing_history_basic":true,"cache_basic":true,"cookies_basic":true,"form_data":true,"hosted_apps_data":true,"media_licenses":true,"passwords":true,"preferences_migrated_to_basic":true,"site_settings":true,"time_period":4,"time_period_basic":4},"clear_lso_data_enabled":true,"has_seen_welcome_page":true,"last_clear_browsing_data_tab":1,"window_placement":{"bottom":720,"left":64,"maximized":false,"right":1200,"top":32}},"credentials_enable_autosignin":false,"credentials_enable_service":false,"default_apps_install_state":2,"download":{"directory_upgrade":true,"prompt_for_download":true},"enable_do_not_track":true,"extensions":{"alerts":{"initialized":true},"ui":{"developer_mode":true}},"media":{"engagement":{"schema_version":4}},"net":{"network_prediction_options":2},"omnibox":{"prevent_url_elisions":true},"payments":{"can_make_payment_enabled":false},"profile":{"avatar_index":24,"block_third_party_cookies":true,"content_settings":{"clear_on_exit_migrated":true,"pref_version":1},"default_content_setting_values":{"background_sync":2,"cookies":1},"exit_type":"Normal","exited_cleanly":true,"local_avatar_index":24,"managed_user_id":"","name":"","password_manager_enabled":false},"safebrowsing":{"enabled":false,"unhandled_sync_password_reuses":{}},"savefile":{"default_directory":"::{20D04FE0-3AEA-1069-A2D8-08002B30309D}"},"search":{"suggest_enabled":false},"zerosuggest":{"cachedresults":""}}
(@echo %cr_loca1%)>"%CrExeDir%%CrUsDa%\Local State"
(@echo %cr_pref1%)>"%CrExeDir%%CrUsDaDef%\Preferences"
(@echo @start Chrome.exe --user-data-dir=..\Data --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --no-default-browser-check)>"%CrExeDir%Chrome-win32\GChromeLauncher.bat"
(@echo @start Chrome.exe --user-data-dir=..\Data --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --no-default-browser-check)>"%CrExeDir%Chrome-win64\GChromeLauncher.bat"

@echo.
@echo Done!
@pause