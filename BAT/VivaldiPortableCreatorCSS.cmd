@echo off
@title Vivaldi downloader + uber1configer ^| ver.1.0 [18.10.2023]
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
@set ViChan=stable
@for /f eol^=-^ tokens^=1-26^ delims^=^'^?^" %%a in ('@curl.exe -lsL "https://vivaldi.com/download" ^| 2^>nul FINDSTR /IRC:"vivaldi-versions.js"') do (@set VIVJS=%%e)
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://vivaldi.com/wp-content/vivaldi-versions.js?%VIVJS%" ^| 2^>nul FINDSTR /IRC:"version"') do (@set VIVER=%%d)
@GOTO DLFIN
:DLSNA
@set ViChan=snapshot
@for /f eol^=-^ tokens^=1-26^ delims^=./^<^>^" %%a in ('@curl.exe -lsL "https://vivaldi.com/feed/" ^| 2^>nul FINDSTR /IRC:"Vivaldi.*.exe"') do (@if NOT DEFINED VIVER (@set VIVER=%%i.%%j.%%k.%%l))
:DLFIN
@echo.Version: "%VIVER%" %ViChan%
@curl.exe -RLO# "https://downloads.vivaldi.com/%ViChan%/Vivaldi.%VIVER%.exe"
@curl.exe -RLO# "https://downloads.vivaldi.com/%ViChan%/Vivaldi.%VIVER%.x64.exe"
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
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Vivaldi/Local%%20State" -o "VivaldiPortable\Data\Local State"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Vivaldi/Preferences" -o "VivaldiPortable\Data\Default\Preferences"
@md "VivaldiPortable\Vivaldi-bin-win32\%VIVER%\CSS\"
@md "VivaldiPortable\Vivaldi-bin-win64\%VIVER%\CSS\"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Vivaldi/custom.css" -o "VivaldiPortable\Vivaldi-bin-win32\%VIVER%\CSS\custom.css"
@copy "VivaldiPortable\Vivaldi-bin-win32\%VIVER%\CSS\custom.css" "VivaldiPortable\Vivaldi-bin-win64\%VIVER%\CSS\custom.css"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Vivaldi/VivaldiLauncher.bat" -o "VivaldiPortable\Vivaldi-bin-win32\VivaldiLauncher.bat"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Vivaldi/VivaldiLauncher.bat" -o "VivaldiPortable\Vivaldi-bin-win64\VivaldiLauncher.bat"

@echo Done!
@pause > nul
