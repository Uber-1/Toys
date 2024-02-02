@echo off
@title Vivaldi downloader + configer mini ^| ver.3.1 [09.10.2023]
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
@for /f eol^=-^ tokens^=1-26^ delims^=^'^?^" %%a in ('@curl.exe -lsL "https://vivaldi.com/download" ^| 2^>nul FINDSTR /IRC:"vivaldi-versions.js"') do (@set VIVJS=%%e)
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://vivaldi.com/wp-content/vivaldi-versions.js?%VIVJS%" ^| 2^>nul FINDSTR /IRC:"version"') do (@set VIVER=%%d)
@echo.Version: "%VIVER%"
@curl.exe -RLO# "https://downloads.vivaldi.com/stable/Vivaldi.%VIVER%.exe"
@curl.exe -RLO# "https://downloads.vivaldi.com/stable/Vivaldi.%VIVER%.x64.exe"
@GOTO DLFIN
:DLSNA
@for /f eol^=-^ tokens^=1-26^ delims^=./^<^>^" %%a in ('@curl.exe -lsL "https://vivaldi.com/feed/" ^| 2^>nul FINDSTR /IRC:"Vivaldi.*.exe"') do (@if NOT DEFINED VIVER (@set VIVER=%%i.%%j.%%k.%%l))
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

@type NUL>"VivaldiPortable\Vivaldi-bin-win32\stp.viv"
@type NUL>"VivaldiPortable\Vivaldi-bin-win64\stp.viv"
@md VivaldiPortable\Data\Default
(@echo {"background_mode":{"enabled":false},"browser":{"enabled_labs_experiments":["ignore-gpu-blocklist","smooth-scrolling@2"]},"hardware_acceleration_mode_previous":true,"profile":{"last_used":"Default"}})>"VivaldiPortable\Data\Local State"
(@echo @start Vivaldi.exe --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --disable-background-networking --disable-component-update --no-default-browser-check)>"VivaldiPortable\Vivaldi-bin-win32\VivaldiLauncher.bat"
(@echo @start Vivaldi.exe --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --disable-background-networking --disable-component-update --no-default-browser-check)>"VivaldiPortable\Vivaldi-bin-win64\VivaldiLauncher.bat"

@echo Done!
@pause > nul