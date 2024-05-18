@echo off
@md AvidemuxPortable &@cd AvidemuxPortable
@for /f "eol=- tokens=1-26 delims=<>/' " %%a in ('@curl.exe -lsL "https://www.avidemux.org/nightly/win64/" ^| @FINDSTR /IRC:"Archive"') do (@set CheckVerAvidemux=%%f)
@echo File name: %CheckVerAvidemux%
@curl.exe -RLO# "https://www.avidemux.org/nightly/win64/%CheckVerAvidemux%" &&@tar -xf "%CheckVerAvidemux%" &&@del /f /q "%CheckVerAvidemux%"
@cd avidemux_64 &@rename avidemux.exe avidemux-portable.exe
@md settings &&(@echo {"update":{"enabled":false,"lastCheck":0},"videodevice":6,"priority":{"encoding":3,"playback":2}})>"settings\config3"
@pause