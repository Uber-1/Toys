@echo off
@title Waterfox Portable Creator + uber1configer ^| ver.1.0.2 [15.05.2025]
@cd /d "%~dp0"

@if exist "curl.exe" @GOTO CURLDL
@if exist "%SystemRoot%\SYSTEM32\curl.exe" @GOTO CURLDL
@echo Downloading with powershell . . .
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://cdn1.waterfox.net'); $wc.DownloadFile('https://cdn1.waterfox.net/waterfox/releases/latest/windows', 'wfwin.exe.7z')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.7-zip.org/a/7zr.exe', '7zr.exe')"
@GOTO MAKECONFIG
:CURLDL
@echo Downloading with CURL . . .
@curl.exe -RL# "https://cdn1.waterfox.net/waterfox/releases/latest/windows" -e"https://cdn1.waterfox.net" -o "wfwin.exe.7z" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0" -H "Sec-GPC: 1"
@curl.exe -RLO# "https://www.7-zip.org/a/7zr.exe"
:MAKECONFIG

@md "WaterfoxPortable\core\defaults\pref"
@md "WaterfoxPortable\core\distribution"
@"7zr.exe" x -t7z -bso0 "wfwin.exe.7z" -o"WaterfoxPortable" -xr!setup.exe -xr!*crashreporter* -xr!*default*agent* -xr!maintenanceservice*.exe -xr!minidump-analyzer.exe -xr!updater* -xr!uninstall
@del "7zr.exe" "wfwin.exe.7z" /q

@md "WaterfoxPortable\portable"
@md "WaterfoxPortable\portable\chrome"

@if exist "curl.exe" @GOTO CURLDLI
@if exist "%SystemRoot%\SYSTEM32\curl.exe" @GOTO CURLDLI
@echo Downloading with powershell . . .
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/autoconfiglocal.js', 'WaterfoxPortable\core\autoconfiglocal.js')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/autoconfig.js', 'WaterfoxPortable\core\defaults\pref\autoconfig.js')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/distribution.ini', 'WaterfoxPortable\core\distribution\distribution.ini')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/policies.json', 'WaterfoxPortable\core\distribution\policies.json')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/userContent.css', 'WaterfoxPortable\portable\chrome\userContent.css')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/userChrome.css', 'WaterfoxPortable\portable\chrome\userChrome.css')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/prefs.js', 'WaterfoxPortable\portable\prefs.js')"
@GOTO CFGDONE
:CURLDLI
@echo Downloading with CURL . . .
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/autoconfiglocal.js" -o "WaterfoxPortable\core\autoconfiglocal.js"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/autoconfig.js" -o "WaterfoxPortable\core\defaults\pref\autoconfig.js"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/distribution.ini" -o "WaterfoxPortable\core\distribution\distribution.ini"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/policies.json" -o "WaterfoxPortable\core\distribution\policies.json"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/userContent.css" -o "WaterfoxPortable\portable\chrome\userContent.css"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/userChrome.css" -o "WaterfoxPortable\portable\chrome\userChrome.css"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/prefs.js" -o "WaterfoxPortable\portable\prefs.js"
:CFGDONE
(@echo {"windows":[],"selectedWindow":0,"_closedWindows":[],"session":{},"scratchpads":[],"global":{}})>"WaterfoxPortable\portable\sessionstore.js"
(@echo @cd core&@echo @start waterfox.exe -no-remote -profile ..\portable %%*)>"WaterfoxPortable\WaterfoxPortable.bat"

@md "WaterfoxPortable\portable\extensions"
@if exist "curl.exe" @GOTO CURLDL2
@if exist "%SystemRoot%\SYSTEM32\curl.exe" @GOTO CURLDL2
@echo Downloading with powershell . . .
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/enhanced-h264ify/', 'WaterfoxPortable\portable\extensions\{9a41dee2-b924-4161-a971-7fb35c053a4a}.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/hls-stream-detector/', 'WaterfoxPortable\portable\extensions\@m3u8link.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/noscript/', 'WaterfoxPortable\portable\extensions\{73a6fe31-595d-460b-a920-fcc0f8843232}.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/save-page-we/', 'WaterfoxPortable\portable\extensions\savepage-we@DW-dev.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/send-to-my-phone-qr-code-gener/', 'WaterfoxPortable\portable\extensions\jid1-dgAsBwQgc4SQBk@jetpack.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/smart-rss-reader/', 'WaterfoxPortable\portable\extensions\smart-rss@mozilla.firefox.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/', 'WaterfoxPortable\portable\extensions\uBlock0@raymondhill.net.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/', 'WaterfoxPortable\portable\extensions\sponsorBlocker@ajay.app.xpi')"
@GOTO XPIDONE
:CURLDL2
@echo Downloading with CURL . . .
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/enhanced-h264ify/" -o "WaterfoxPortable\portable\extensions\{9a41dee2-b924-4161-a971-7fb35c053a4a}.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/hls-stream-detector/" -o "WaterfoxPortable\portable\extensions\@m3u8link.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/noscript/" -o "WaterfoxPortable\portable\extensions\{73a6fe31-595d-460b-a920-fcc0f8843232}.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/save-page-we/" -o "WaterfoxPortable\portable\extensions\savepage-we@DW-dev.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/send-to-my-phone-qr-code-gener/" -o "WaterfoxPortable\portable\extensions\jid1-dgAsBwQgc4SQBk@jetpack.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/smart-rss-reader/" -o "WaterfoxPortable\portable\extensions\smart-rss@mozilla.firefox.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/" -o "WaterfoxPortable\portable\extensions\uBlock0@raymondhill.net.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/" -o "WaterfoxPortable\portable\extensions\sponsorBlocker@ajay.app.xpi"
:XPIDONE
