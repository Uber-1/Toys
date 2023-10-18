@echo off
@title Chromium downloader + uber1configer ^| ver.1.0 [18.10.2023]
@cd /d "%~dp0"
@md Chromium
@cd Chromium

@echo Download, unpack...
@if "%PROCESSOR_ARCHITECTURE%" NEQ "AMD64" (
@curl -RL# "https://download-chromium.appspot.com/dl/Win" -o "chrome-win.zip"
@tar -xf "chrome-win.zip"
@curl -RL# "https://github.com/Bush2021/chrome_plus/raw/main/setdll/chrome++32.dll" -o "chrome-win\version.dll"
@curl -RL# "https://github.com/Bush2021/chrome_plus/raw/main/setdll/chrome++.ini" -o "chrome-win\chrome++.ini"
) else (
@curl -RL# "https://download-chromium.appspot.com/dl/Win_x64" -o "chrome-win.zip"
@tar -xf "chrome-win.zip"
@curl -RL# "https://github.com/Bush2021/chrome_plus/raw/main/setdll/chrome++64.dll" -o "chrome-win\version.dll"
@curl -RL# "https://github.com/Bush2021/chrome_plus/raw/main/setdll/chrome++.ini" -o "chrome-win\chrome++.ini"
)
@del /f /q /s chrome-win.zip interactive_ui_tests.exe "a*.pak" "b*.pak" "ca.pak" "cs.pak" "d*.pak" "e?.pak" en-GB.pak en-XA.pak "es*.pak" "f*.pak" "g*.pak" "h*.pak" "i*.pak" "j*.pak" "k*.pak" "l*.pak" "m*.pak" "n*.pak" "o*.pak" "p*.pak" "q*.pak" "ro.pak" "s*.pak" "t*.pak" "ur.pak" "v*.pak" "w*.pak" "z*.pak" > nul

@echo Config...
@md "Data\Default\"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Chrome/master_preferences" -o "chrome-win\master_preferences"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Chrome/Local%%20State" -o "Data\Local State"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Chrome/Preferences" -o "Data\Default\Preferences"
(@echo @cd chrome-win &@echo @start Chrome.exe --user-data-dir=..\Data --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --no-default-browser-check)>"ChromiumLauncher.bat"

@echo Done!
@pause
