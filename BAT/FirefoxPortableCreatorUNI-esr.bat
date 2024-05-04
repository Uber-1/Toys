@echo off
@title Firefox Portable Creator + uber1configer ^| ver.1.0 [18.10.2023]
@cd /d "%~dp0"

:: https://ftp.mozilla.org/pub/firefox/releases/latest-esr/README.txt
:: product=firefox-esr-latest	- version
:: os=win	- 32 bits
:: os=win64	- 64 bits
:: lang=en-US	- English
:: lang=ru	- Russian
:: lang=uk	- Ukrainian

@if not exist "curl.exe" (@if not exist "%SystemRoot%\SYSTEM32\curl.exe" (
@echo Downloading with powershell . . .
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://download.mozilla.org'); $wc.DownloadFile('https://download.mozilla.org/?product=firefox-esr-latest&os=win&lang=en-US', 'ffwin.exe.7z')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.7-zip.org/a/7zr.exe', '7zr.exe')"
)) else (
@echo Downloading with CURL . . .
@curl.exe -RL# "https://download.mozilla.org/?product=firefox-esr-latest&os=win&lang=en-US" -e"https://download.mozilla.org" -o "ffwin.exe.7z"
@curl.exe -RLO# "https://www.7-zip.org/a/7zr.exe"
)

@md "FirefoxPortable\core\defaults\pref"
@md "FirefoxPortable\core\distribution"
@"7zr.exe" x -t7z -bso0 "ffwin.exe.7z" -o"FirefoxPortable" -xr!setup.exe -xr!*crashreporter* -xr!*default*agent* -xr!maintenanceservice*.exe -xr!minidump-analyzer.exe -xr!updater* -xr!uninstall
@del "7zr.exe" "ffwin.exe.7z" /q

@md "FirefoxPortable\portable"
@md "FirefoxPortable\portable\chrome"

@if not exist "curl.exe" (@if not exist "%SystemRoot%\SYSTEM32\curl.exe" (
@echo Downloading with powershell . . .
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/autoconfiglocal.js', 'FirefoxPortable\core\autoconfiglocal.js')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/autoconfig.js', 'FirefoxPortable\core\defaults\pref\autoconfig.js')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/distribution.ini', 'FirefoxPortable\core\distribution\distribution.ini')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/policies.json', 'FirefoxPortable\core\distribution\policies.json')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/userContent.css', 'FirefoxPortable\portable\chrome\userContent.css')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/userChrome.css', 'FirefoxPortable\portable\chrome\userChrome.css')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Uber-1/Toys/raw/main/Firefox/prefs.js', 'FirefoxPortable\portable\prefs.js')"
)) else (
@echo Downloading with CURL . . .
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/autoconfiglocal.js" -o "FirefoxPortable\core\autoconfiglocal.js"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/autoconfig.js" -o "FirefoxPortable\core\defaults\pref\autoconfig.js"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/distribution.ini" -o "FirefoxPortable\core\distribution\distribution.ini"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/policies.json" -o "FirefoxPortable\core\distribution\policies.json"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/userContent.css" -o "FirefoxPortable\portable\chrome\userContent.css"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/userChrome.css" -o "FirefoxPortable\portable\chrome\userChrome.css"
@curl -RL# "https://github.com/Uber-1/Toys/raw/main/Firefox/prefs.js" -o "FirefoxPortable\portable\prefs.js"
)
(@echo {"windows":[],"selectedWindow":0,"_closedWindows":[],"session":{},"scratchpads":[],"global":{}})>"FirefoxPortable\portable\sessionstore.js"
(@echo @cd core&@echo @start firefox.exe -no-remote -profile ..\portable %%*)>"FirefoxPortable\FirefoxPortable.bat"

@md "FirefoxPortable\portable\extensions"
@if not exist "curl.exe" (@if not exist "%SystemRoot%\SYSTEM32\curl.exe" (
@echo Downloading with powershell . . .
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/enhanced-h264ify/', 'FirefoxPortable\portable\extensions\{9a41dee2-b924-4161-a971-7fb35c053a4a}.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/hls-stream-detector/', 'FirefoxPortable\portable\extensions\@m3u8link.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/noscript/', 'FirefoxPortable\portable\extensions\{73a6fe31-595d-460b-a920-fcc0f8843232}.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/save-page-we/', 'FirefoxPortable\portable\extensions\savepage-we@DW-dev.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/send-to-my-phone-qr-code-gener/', 'FirefoxPortable\portable\extensions\jid1-dgAsBwQgc4SQBk@jetpack.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/smart-rss-reader/', 'FirefoxPortable\portable\extensions\smart-rss@mozilla.firefox.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/', 'FirefoxPortable\portable\extensions\uBlock0@raymondhill.net.xpi')"
@powershell -Command "(New-Object Net.WebClient).DownloadFile('https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/', 'FirefoxPortable\portable\extensions\sponsorBlocker@ajay.app.xpi')"
)) else (
@echo Downloading with CURL . . .
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/enhanced-h264ify/" -o "FirefoxPortable\portable\extensions\{9a41dee2-b924-4161-a971-7fb35c053a4a}.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/hls-stream-detector/" -o "FirefoxPortable\portable\extensions\@m3u8link.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/noscript/" -o "FirefoxPortable\portable\extensions\{73a6fe31-595d-460b-a920-fcc0f8843232}.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/save-page-we/" -o "FirefoxPortable\portable\extensions\savepage-we@DW-dev.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/send-to-my-phone-qr-code-gener/" -o "FirefoxPortable\portable\extensions\jid1-dgAsBwQgc4SQBk@jetpack.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/smart-rss-reader/" -o "FirefoxPortable\portable\extensions\smart-rss@mozilla.firefox.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/" -o "FirefoxPortable\portable\extensions\uBlock0@raymondhill.net.xpi"
@curl -RL# "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/" -o "FirefoxPortable\portable\extensions\sponsorBlocker@ajay.app.xpi"
)
