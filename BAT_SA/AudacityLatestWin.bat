@echo off
@title %~n0%~x0
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://api.github.com/repos/audacity/audacity/releases/latest" ^| @FINDSTR /IRC:"browser_download_url.*win.*.zip"') do (@curl -RLO# %%d)
(@echo PrefsVersion=1.1.1r1&@echo TEST=1&@echo WantAssociateFiles=0&@echo [Update]&@echo UpdateNoticeShown=1&@echo DefaultUpdatesChecking=0)>"audacity.cfg"
@for %%a in (*win*.zip) do (@tar -xf "%%~a" &&@md "%%~na\Portable Settings" &&@copy "audacity.cfg" "%%~na\Portable Settings\audacity.cfg" &&@del "%%~a")
@echo Done.