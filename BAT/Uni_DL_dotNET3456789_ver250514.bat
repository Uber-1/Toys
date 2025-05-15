@echo off
@title Redistributable downloads: .NET Desktop Runtime
@echo .NET Desktop

@set UsePS=0
@if not exist "curl.exe" @if not exist "%SystemRoot%\SYSTEM32\curl.exe" (@set UsePS=1&@color 0C&@echo curl.exe not Found!)
@if /i "%1"=="0" @set UsePS=0
@if /i "%1"=="1" @set UsePS=1

@echo PS Script
@echo https://dotnet.microsoft.com/en-us/download/dotnet/scripts

@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1"
 @curl.exe -RL# "https://docs.microsoft.com/dotnet/core/tools/dotnet-install-script?WT.mc_id=dotnet-35129-website" -o "dotnet-install scripts reference.htm"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/scripts'); $wc.DownloadFile('https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1', 'dotnet-install.ps1')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/scripts'); $wc.DownloadFile('https://docs.microsoft.com/dotnet/core/tools/dotnet-install-script?WT.mc_id=dotnet-35129-website', 'dotnet-install scripts reference.htm')"
)

@echo+
@echo 9.0.5
@echo https://dotnet.microsoft.com/en-us/download/dotnet/9.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/9.0.5/windowsdesktop-runtime-9.0.5-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/9.0.5/windowsdesktop-runtime-9.0.5-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.5/dotnet-runtime-9.0.5-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.5/dotnet-runtime-9.0.5-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.5/dotnet-runtime-9.0.5-win-x86.zip"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.5/dotnet-runtime-9.0.5-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/9.0.5/windowsdesktop-runtime-9.0.5-win-x86.exe', 'windowsdesktop-runtime-9.0.5-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/9.0.5/windowsdesktop-runtime-9.0.5-win-x64.exe', 'windowsdesktop-runtime-9.0.5-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.5/dotnet-runtime-9.0.5-win-x86.exe', 'dotnet-runtime-9.0.5-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.5/dotnet-runtime-9.0.5-win-x64.exe', 'dotnet-runtime-9.0.5-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.5/dotnet-runtime-9.0.5-win-x86.zip', 'dotnet-runtime-9.0.5-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.5/dotnet-runtime-9.0.5-win-x64.zip', 'dotnet-runtime-9.0.5-win-x64.zip')"
)
@md 9-0 &@move "*9.0*.*" "9-0\"

@echo+
@echo 8.0.16
@echo https://dotnet.microsoft.com/en-us/download/dotnet/8.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/8.0.16/windowsdesktop-runtime-8.0.16-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/8.0.16/windowsdesktop-runtime-8.0.16-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/8.0.16/dotnet-runtime-8.0.16-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/8.0.16/dotnet-runtime-8.0.16-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/8.0.16/dotnet-runtime-8.0.16-win-x86.zip"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/8.0.16/dotnet-runtime-8.0.16-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/8.0.16/windowsdesktop-runtime-8.0.16-win-x86.exe', 'windowsdesktop-runtime-8.0.16-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/8.0.16/windowsdesktop-runtime-8.0.16-win-x64.exe', 'windowsdesktop-runtime-8.0.16-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/8.0.16/dotnet-runtime-8.0.16-win-x86.exe', 'dotnet-runtime-8.0.16-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/8.0.16/dotnet-runtime-8.0.16-win-x64.exe', 'dotnet-runtime-8.0.16-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/8.0.16/dotnet-runtime-8.0.16-win-x86.zip', 'dotnet-runtime-8.0.16-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/8.0.16/dotnet-runtime-8.0.16-win-x64.zip', 'dotnet-runtime-8.0.16-win-x64.zip')"
)
@md 8-0 &@move "*8.0*.*" "8-0\"

@echo+
@echo 7.0.20
@echo https://dotnet.microsoft.com/en-us/download/dotnet/7.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/7.0.20/windowsdesktop-runtime-7.0.20-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/7.0.20/windowsdesktop-runtime-7.0.20-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/7.0.20/dotnet-runtime-7.0.20-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/7.0.20/dotnet-runtime-7.0.20-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/7.0.20/dotnet-runtime-7.0.20-win-x86.zip"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/7.0.20/dotnet-runtime-7.0.20-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/7.0.20/windowsdesktop-runtime-7.0.20-win-x86.exe', 'windowsdesktop-runtime-7.0.20-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/7.0.20/windowsdesktop-runtime-7.0.20-win-x64.exe', 'windowsdesktop-runtime-7.0.20-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/7.0.20/dotnet-runtime-7.0.20-win-x86.exe', 'dotnet-runtime-7.0.20-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/7.0.20/dotnet-runtime-7.0.20-win-x64.exe', 'dotnet-runtime-7.0.20-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/7.0.20/dotnet-runtime-7.0.20-win-x86.zip', 'dotnet-runtime-7.0.20-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/7.0.20/dotnet-runtime-7.0.20-win-x64.zip', 'dotnet-runtime-7.0.20-win-x64.zip')"
)
@md 7-0 &@move "*7.0*.*" "7-0\"

@echo+
@echo 6.0.36
@echo https://dotnet.microsoft.com/en-us/download/dotnet/6.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/6.0.36/windowsdesktop-runtime-6.0.36-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/6.0.36/windowsdesktop-runtime-6.0.36-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/6.0.36/dotnet-runtime-6.0.36-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/6.0.36/dotnet-runtime-6.0.36-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/6.0.36/dotnet-runtime-6.0.36-win-x86.zip"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/6.0.36/dotnet-runtime-6.0.36-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/6.0.36/windowsdesktop-runtime-6.0.36-win-x86.exe', 'windowsdesktop-runtime-6.0.36-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/6.0.36/windowsdesktop-runtime-6.0.36-win-x64.exe', 'windowsdesktop-runtime-6.0.36-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/6.0.36/dotnet-runtime-6.0.36-win-x86.exe', 'dotnet-runtime-6.0.36-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/6.0.36/dotnet-runtime-6.0.36-win-x64.exe', 'dotnet-runtime-6.0.36-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/6.0.36/dotnet-runtime-6.0.36-win-x86.zip', 'dotnet-runtime-6.0.36-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/6.0.36/dotnet-runtime-6.0.36-win-x64.zip', 'dotnet-runtime-6.0.36-win-x64.zip')"
)
@md 6-0 &@move "*6.0*.*" "6-0\"

@echo+
@echo 5.0.17
@echo https://dotnet.microsoft.com/en-us/download/dotnet/5.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/5.0.17/windowsdesktop-runtime-5.0.17-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/5.0.17/windowsdesktop-runtime-5.0.17-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/5.0.17/dotnet-runtime-5.0.17-win-x86.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/5.0.17/dotnet-runtime-5.0.17-win-x64.exe"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/5.0.17/dotnet-runtime-5.0.17-win-x86.zip"
 @curl.exe -RLO# "https://builds.dotnet.microsoft.com/dotnet/Runtime/5.0.17/dotnet-runtime-5.0.17-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/5.0.17/windowsdesktop-runtime-5.0.17-win-x86.exe', 'windowsdesktop-runtime-5.0.17-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/5.0.17/windowsdesktop-runtime-5.0.17-win-x64.exe', 'windowsdesktop-runtime-5.0.17-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/5.0.17/dotnet-runtime-5.0.17-win-x86.exe', 'dotnet-runtime-5.0.17-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/5.0.17/dotnet-runtime-5.0.17-win-x64.exe', 'dotnet-runtime-5.0.17-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/5.0.17/dotnet-runtime-5.0.17-win-x86.zip', 'dotnet-runtime-5.0.17-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://builds.dotnet.microsoft.com/dotnet/Runtime/5.0.17/dotnet-runtime-5.0.17-win-x64.zip', 'dotnet-runtime-5.0.17-win-x64.zip')"
)
@md 5-0 &@move "*5.0*.*" "5-0\"

@echo+
@echo 4.8.1
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net481
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/6f083c7e-bd40-44d4-9e3f-ffba71ec8b09/d05099507287c103a91bb68994498bde/ndp481-web.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/6f083c7e-bd40-44d4-9e3f-ffba71ec8b09/3951fd5af6098f2c7e8ff5c331a0679c/ndp481-x86-x64-allos-enu.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/6/4/c/64c45308-d7e1-43b7-9b12-8de90cd8d1b6/ndp481-x86-x64-allos-rus.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net481'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/6f083c7e-bd40-44d4-9e3f-ffba71ec8b09/d05099507287c103a91bb68994498bde/ndp481-web.exe', 'ndp481-web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net481'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/6f083c7e-bd40-44d4-9e3f-ffba71ec8b09/3951fd5af6098f2c7e8ff5c331a0679c/ndp481-x86-x64-allos-enu.exe', 'ndp481-x86-x64-allos-enu.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net481'); $wc.DownloadFile('https://download.microsoft.com/download/6/4/c/64c45308-d7e1-43b7-9b12-8de90cd8d1b6/ndp481-x86-x64-allos-rus.exe', 'ndp481-x86-x64-allos-rus.exe')"
)
@echo 4.8
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/9b7b8746971ed51a1770ae4293618187/ndp48-web.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/c2ad65ab-bab3-4d24-ada4-aaf2ff0c1266/df923e55b4e4d2c199bf59c53f26050d/ndp48-x86-x64-allos-rus.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/9b7b8746971ed51a1770ae4293618187/ndp48-web.exe', 'ndp48-web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe', 'ndp48-x86-x64-allos-enu.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/c2ad65ab-bab3-4d24-ada4-aaf2ff0c1266/df923e55b4e4d2c199bf59c53f26050d/ndp48-x86-x64-allos-rus.exe', 'ndp48-x86-x64-allos-rus.exe')"
)
@md 4-8
@move "*ndp48*.*" "4-8\"

@echo+
@echo 4.7.2
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net472

@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/1f5af042-d0e4-4002-9c59-9ba66bcf15f6/124d2afe5c8f67dfa910da5f9e3db9c1/ndp472-kb4054531-web.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/1f5af042-d0e4-4002-9c59-9ba66bcf15f6/089f837de42708daacaae7c04b7494db/ndp472-kb4054530-x86-x64-allos-enu.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/1f5af042-d0e4-4002-9c59-9ba66bcf15f6/4ea99bed7046d230a17df76849b5d955/ndp472-kb4054530-x86-x64-allos-rus.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net472'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/1f5af042-d0e4-4002-9c59-9ba66bcf15f6/124d2afe5c8f67dfa910da5f9e3db9c1/ndp472-kb4054531-web.exe', 'ndp472-kb4054531-web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net472'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/1f5af042-d0e4-4002-9c59-9ba66bcf15f6/089f837de42708daacaae7c04b7494db/ndp472-kb4054530-x86-x64-allos-enu.exe', 'ndp472-kb4054530-x86-x64-allos-enu.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net472'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/1f5af042-d0e4-4002-9c59-9ba66bcf15f6/4ea99bed7046d230a17df76849b5d955/ndp472-kb4054530-x86-x64-allos-rus.exe', 'ndp472-kb4054530-x86-x64-allos-rus.exe')"
)
@echo 4.7.1
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net471
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/4312fa21-59b0-4451-9482-a1376f7f3ba4/741e7b1eef95985956fb07c26be9befc/ndp471-kb4033344-web.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/4312fa21-59b0-4451-9482-a1376f7f3ba4/9947fce13c11105b48cba170494e787f/ndp471-kb4033342-x86-x64-allos-enu.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/4312fa21-59b0-4451-9482-a1376f7f3ba4/e7b715ebbfce7ab78e5df982da1c9ab0/ndp471-kb4033342-x86-x64-allos-rus.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net471'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/4312fa21-59b0-4451-9482-a1376f7f3ba4/741e7b1eef95985956fb07c26be9befc/ndp471-kb4033344-web.exe', 'ndp471-kb4033344-web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net471'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/4312fa21-59b0-4451-9482-a1376f7f3ba4/9947fce13c11105b48cba170494e787f/ndp471-kb4033342-x86-x64-allos-enu.exe', 'ndp471-kb4033342-x86-x64-allos-enu.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net471'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/4312fa21-59b0-4451-9482-a1376f7f3ba4/e7b715ebbfce7ab78e5df982da1c9ab0/ndp471-kb4033342-x86-x64-allos-rus.exe', 'ndp471-kb4033342-x86-x64-allos-rus.exe')"
)
@echo 4.7
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net47
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/2dfcc711-bb60-421a-a17b-76c63f8d1907/f1586a8eb570edb04d91385d0e654348/ndp47-kb3186500-web.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/2dfcc711-bb60-421a-a17b-76c63f8d1907/e5c0231bd5d51fffe65f8ed7516de46a/ndp47-kb3186497-x86-x64-allos-enu.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/2dfcc711-bb60-421a-a17b-76c63f8d1907/4883a8d39a51c6f7ee9b936b5b5bdf4a/ndp47-kb3186497-x86-x64-allos-rus.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net47'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/2dfcc711-bb60-421a-a17b-76c63f8d1907/f1586a8eb570edb04d91385d0e654348/ndp47-kb3186500-web.exe', 'ndp47-kb3186500-web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net47'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/2dfcc711-bb60-421a-a17b-76c63f8d1907/e5c0231bd5d51fffe65f8ed7516de46a/ndp47-kb3186497-x86-x64-allos-enu.exe', 'ndp47-kb3186497-x86-x64-allos-enu.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net47'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/2dfcc711-bb60-421a-a17b-76c63f8d1907/4883a8d39a51c6f7ee9b936b5b5bdf4a/ndp47-kb3186497-x86-x64-allos-rus.exe', 'ndp47-kb3186497-x86-x64-allos-rus.exe')"
)
@md 4-7
@move "*ndp47*.*" "4-7\"

@echo+
@echo 4.6.2
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net462

@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/8e396c75-4d0d-41d3-aea8-848babc2736a/570f7c7e1975df353a4652ae70b3e0ac/ndp462-kb3151802-web.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/8e396c75-4d0d-41d3-aea8-848babc2736a/80b431456d8866ebe053eb8b81a168b3/ndp462-kb3151800-x86-x64-allos-enu.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/8e396c75-4d0d-41d3-aea8-848babc2736a/207cccbe65962c45da3592785f446205/ndp462-kb3151800-x86-x64-allos-rus.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net462'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/8e396c75-4d0d-41d3-aea8-848babc2736a/570f7c7e1975df353a4652ae70b3e0ac/ndp462-kb3151802-web.exe', 'ndp462-kb3151802-web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net462'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/8e396c75-4d0d-41d3-aea8-848babc2736a/80b431456d8866ebe053eb8b81a168b3/ndp462-kb3151800-x86-x64-allos-enu.exe', 'ndp462-kb3151800-x86-x64-allos-enu.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net462'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/8e396c75-4d0d-41d3-aea8-848babc2736a/207cccbe65962c45da3592785f446205/ndp462-kb3151800-x86-x64-allos-rus.exe', 'ndp462-kb3151800-x86-x64-allos-rus.exe')"
)
@echo 4.6.1
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net461
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.microsoft.com/download/3/5/9/35980F81-60F4-4DE3-88FC-8F962B97253B/NDP461-KB3102438-Web.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/E/4/1/E4173890-A24A-4936-9FC9-AF930FE3FA40/NDP461-KB3102436-x86-x64-AllOS-ENU.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/A/A/5/AA5F5984-510E-4023-BBBA-49AA550DEC99/enu_netfx/NDP461-KB3102436-x86-x64-AllOS-RUS_exe/NDP461-KB3102436-x86-x64-AllOS-RUS.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net461'); $wc.DownloadFile('https://download.microsoft.com/download/3/5/9/35980F81-60F4-4DE3-88FC-8F962B97253B/NDP461-KB3102438-Web.exe', 'NDP461-KB3102438-Web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net461'); $wc.DownloadFile('https://download.microsoft.com/download/E/4/1/E4173890-A24A-4936-9FC9-AF930FE3FA40/NDP461-KB3102436-x86-x64-AllOS-ENU.exe', 'NDP461-KB3102436-x86-x64-AllOS-ENU.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net461'); $wc.DownloadFile('https://download.microsoft.com/download/A/A/5/AA5F5984-510E-4023-BBBA-49AA550DEC99/enu_netfx/NDP461-KB3102436-x86-x64-AllOS-RUS_exe/NDP461-KB3102436-x86-x64-AllOS-RUS.exe', 'NDP461-KB3102436-x86-x64-AllOS-RUS.exe')"
)
@echo 4.6
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net46
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.microsoft.com/download/1/4/A/14A6C422-0D3C-4811-A31F-5EF91A83C368/NDP46-KB3045560-Web.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/6/F/9/6F9673B1-87D1-46C4-BF04-95F24C3EB9DA/enu_netfx/NDP46-KB3045557-x86-x64-AllOS-ENU_exe/NDP46-KB3045557-x86-x64-AllOS-ENU.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/F/2/A/F2ADB2B0-C99C-432D-A98D-DB79369F6910/NDP46-KB3045557-x86-x64-AllOS-RUS.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net46'); $wc.DownloadFile('https://download.microsoft.com/download/1/4/A/14A6C422-0D3C-4811-A31F-5EF91A83C368/NDP46-KB3045560-Web.exe', 'NDP46-KB3045560-Web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net46'); $wc.DownloadFile('https://download.microsoft.com/download/6/F/9/6F9673B1-87D1-46C4-BF04-95F24C3EB9DA/enu_netfx/NDP46-KB3045557-x86-x64-AllOS-ENU_exe/NDP46-KB3045557-x86-x64-AllOS-ENU.exe', 'NDP46-KB3045557-x86-x64-AllOS-ENU.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net46'); $wc.DownloadFile('https://download.microsoft.com/download/F/2/A/F2ADB2B0-C99C-432D-A98D-DB79369F6910/NDP46-KB3045557-x86-x64-AllOS-RUS.exe', 'NDP46-KB3045557-x86-x64-AllOS-RUS.exe')"
)
@md 4-6
@move "*ndp46*.*" "4-6\"


@echo+
@echo 4.5.2
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net452
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.microsoft.com/download/9/A/7/9A78F13F-FD62-4F6D-AB6B-1803508A9F56/51209.34209.03/web/NDP452-KB2901954-Web.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/8/8/A/88AD380C-AA62-4FC3-A159-D30B3D1569E3/NDP452-KB2901907-x86-x64-AllOS-RUS.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net452'); $wc.DownloadFile('https://download.microsoft.com/download/9/A/7/9A78F13F-FD62-4F6D-AB6B-1803508A9F56/51209.34209.03/web/NDP452-KB2901954-Web.exe', 'NDP452-KB2901954-Web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net452'); $wc.DownloadFile('https://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe', 'NDP452-KB2901907-x86-x64-AllOS-ENU.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net452'); $wc.DownloadFile('https://download.microsoft.com/download/8/8/A/88AD380C-AA62-4FC3-A159-D30B3D1569E3/NDP452-KB2901907-x86-x64-AllOS-RUS.exe', 'NDP452-KB2901907-x86-x64-AllOS-RUS.exe')"
)
@echo 4.5.1
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net451
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.microsoft.com/download/7/4/0/74078A56-A3A1-492D-BBA9-865684B83C1B/NDP451-KB2859818-Web.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/1/6/7/167F0D79-9317-48AE-AEDB-17120579F8E2/NDP451-KB2858728-x86-x64-AllOS-ENU.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/4/D/A/4DA6387E-28C3-4961-9F51-4D32C654E55D/NDP451-KB2858728-x86-x64-AllOS-RUS.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net451'); $wc.DownloadFile('https://download.microsoft.com/download/7/4/0/74078A56-A3A1-492D-BBA9-865684B83C1B/NDP451-KB2859818-Web.exe', 'NDP451-KB2859818-Web.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net451'); $wc.DownloadFile('https://download.microsoft.com/download/1/6/7/167F0D79-9317-48AE-AEDB-17120579F8E2/NDP451-KB2858728-x86-x64-AllOS-ENU.exe', 'NDP451-KB2858728-x86-x64-AllOS-ENU.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net451'); $wc.DownloadFile('https://download.microsoft.com/download/4/D/A/4DA6387E-28C3-4961-9F51-4D32C654E55D/NDP451-KB2858728-x86-x64-AllOS-RUS.exe', 'NDP451-KB2858728-x86-x64-AllOS-RUS.exe')"
)
@echo 4.5
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net45
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.microsoft.com/download/b/a/4/ba4a7e71-2906-4b2d-a0e1-80cf16844f5f/dotnetfx45_full_x86_x64.exe"
 @curl.exe -RLO# "https://download.microsoft.com/download/B/A/4/BA4A7E71-2906-4B2D-A0E1-80CF16844F5F/dotNetFx45_Full_setup.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net45'); $wc.DownloadFile('https://download.microsoft.com/download/b/a/4/ba4a7e71-2906-4b2d-a0e1-80cf16844f5f/dotnetfx45_full_x86_x64.exe', 'dotnetfx45_full_x86_x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net45'); $wc.DownloadFile('https://download.microsoft.com/download/B/A/4/BA4A7E71-2906-4B2D-A0E1-80CF16844F5F/dotNetFx45_Full_setup.exe', 'dotNetFx45_Full_setup.exe')"
)
@md 4-5
@move "*ndp45*.*" "4-5\"
@move "*fx45*.*" "4-5\"

@echo+
@echo 4.0
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net40
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.microsoft.com/download/9/5/A/95A9616B-7A37-4AF6-BC36-D6EA96C8DAAE/dotNetFx40_Full_x86_x64.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net40'); $wc.DownloadFile('https://download.microsoft.com/download/9/5/A/95A9616B-7A37-4AF6-BC36-D6EA96C8DAAE/dotNetFx40_Full_x86_x64.exe', 'dotNetFx40_Full_x86_x64.exe')"
)
@md 4-0
@move "*fx40*.*" "4-0\"

@echo+
@echo 3.5 SP1
@echo https://dotnet.microsoft.com/en-us/download/dotnet-framework/net35-sp1
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/b635098a-2d1d-4142-bef6-d237545123cb/2651b87007440a15209cac29634a4e45/dotnetfx35.exe"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet-framework/net35-sp1'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/b635098a-2d1d-4142-bef6-d237545123cb/2651b87007440a15209cac29634a4e45/dotnetfx35.exe', 'dotnetfx35.exe')"
)
@md 3-5
@move "*fx35*.*" "3-5\"

(
@echo 241D399B    *3-5\dotnetfx35.exe
@echo 2BF60F61    *4-0\dotNetFx40_Full_x86_x64.exe
@echo A1E775A6    *4-5\NDP451-KB2858728-x86-x64-AllOS-ENU.exe
@echo 6D1BE439    *4-5\NDP451-KB2858728-x86-x64-AllOS-RUS.exe
@echo B6573DFA    *4-5\NDP451-KB2859818-Web.exe
@echo A322A096    *4-5\NDP452-KB2901907-x86-x64-AllOS-ENU.exe
@echo 3D5BC44D    *4-5\NDP452-KB2901907-x86-x64-AllOS-RUS.exe
@echo 240CAD9F    *4-5\NDP452-KB2901954-Web.exe
@echo C820BD1D    *4-5\dotnetfx45_full_x86_x64.exe
@echo FF8C6D0F    *4-5\dotNetFx45_Full_setup.exe
@echo 3E950D80    *4-6\NDP46-KB3045557-x86-x64-AllOS-ENU.exe
@echo 5ADE0C26    *4-6\NDP46-KB3045557-x86-x64-AllOS-RUS.exe
@echo E8A4B7D2    *4-6\NDP46-KB3045560-Web.exe
@echo 7763F6BA    *4-6\NDP461-KB3102436-x86-x64-AllOS-ENU.exe
@echo E7E24788    *4-6\NDP461-KB3102436-x86-x64-AllOS-RUS.exe
@echo 41E4F488    *4-6\NDP461-KB3102438-Web.exe
@echo 41031705    *4-6\ndp462-kb3151800-x86-x64-allos-enu.exe
@echo 679B0F5B    *4-6\ndp462-kb3151800-x86-x64-allos-rus.exe
@echo A9DDA364    *4-6\ndp462-kb3151802-web.exe
@echo A293598C    *4-7\ndp47-kb3186497-x86-x64-allos-enu.exe
@echo 3358219D    *4-7\ndp47-kb3186497-x86-x64-allos-rus.exe
@echo F29710A1    *4-7\ndp47-kb3186500-web.exe
@echo 59287C6C    *4-7\ndp471-kb4033342-x86-x64-allos-enu.exe
@echo E438ED3E    *4-7\ndp471-kb4033342-x86-x64-allos-rus.exe
@echo EDC19CA1    *4-7\ndp471-kb4033344-web.exe
@echo 35B76D4B    *4-7\ndp472-kb4054530-x86-x64-allos-enu.exe
@echo 1C414377    *4-7\ndp472-kb4054530-x86-x64-allos-rus.exe
@echo 195F2D52    *4-7\ndp472-kb4054531-web.exe
@echo 99B1D055    *4-8\ndp48-web.exe
@echo 16DEC4CD    *4-8\ndp48-x86-x64-allos-enu.exe
@echo E8A21CC4    *4-8\ndp48-x86-x64-allos-rus.exe
@echo FF2A085E    *4-8\ndp481-web.exe
@echo 77EACE97    *4-8\ndp481-x86-x64-allos-enu.exe
@echo 9EE5D845    *4-8\ndp481-x86-x64-allos-rus.exe
@echo 53035A4B    *5-0\dotnet-runtime-5.0.17-win-x64.exe
@echo EB10E153    *5-0\dotnet-runtime-5.0.17-win-x64.zip
@echo F8985666    *5-0\dotnet-runtime-5.0.17-win-x86.exe
@echo 3E4F6135    *5-0\dotnet-runtime-5.0.17-win-x86.zip
@echo 4B8FAC4F    *5-0\windowsdesktop-runtime-5.0.17-win-x64.exe
@echo C3FC42BB    *5-0\windowsdesktop-runtime-5.0.17-win-x86.exe
)>crc32.sfv

(
@echo a19d271cbf77504077d31af88c2532d18076ccbce1685fbc88d72efa38fafb0b0e8c93ea3c6c49a29b31214bf8c9e8ef0230f6fc819b484438d803cf684b6752 *9-0\windowsdesktop-runtime-9.0.5-win-x86.exe
@echo 89b536b45d2497489f3e96b1d956cb03df97fca14758fcc5b96eb260338036e3d3c8a242d98627e47219abaed65a4b2765226dc71e3753869260701a5a76171c *9-0\windowsdesktop-runtime-9.0.5-win-x64.exe
@echo b6e61405c8a34c3333691b88255a7fe3d5b7939bdd53aefeea042d4d0c78f65d0ec26cd7aafccb66c495068643e460d79c7d1e401e8252702719ca052b6e3aff *9-0\dotnet-runtime-9.0.5-win-x86.exe
@echo 122bfc33930db846c85b811d762afdbcc15744c112eed1a7d356242e7fe66d3158a5dd9c105a6620cf71e93a7c517a9fda5c2b9a7d8cde5add229fcd254ebf70 *9-0\dotnet-runtime-9.0.5-win-x64.exe
@echo aa2c68edde03b2dd9b92e9b79b9616fe71b826ef90027ff724a966ef5835c8d77b6a22dc15645fc071b898f16a5c8f0484b634eaede87ea167bd9ec04d5a8830 *9-0\dotnet-runtime-9.0.5-win-x86.zip
@echo 907dce00c1807d7b5120885a860747a55bffd843f0b3e26a7ce5f4bfc13f36bdd56d16341db74946ea29b1b9a67d038f0a776bd697eb27feb1af722957d459f7 *9-0\dotnet-runtime-9.0.5-win-x64.zip
@echo f91558eba877dd98aa2c69e7db5cb1d78519e5c958c2d6b153e6a7412ecfe9c91c6f5d38ed762d698d08775b05d2746aaa617c032024ef9d2d568fe1e2e96aa7 *8-0\windowsdesktop-runtime-8.0.16-win-x86.exe
@echo 526c0cf217c04f590ab5b88de4bff41f4f4ca13c4efb4f79bbaafe0b24fc48fdae1e769b0011bf8020b1ad6d8fbf6e1f31175045e86ee9c578a4892124828c2f *8-0\windowsdesktop-runtime-8.0.16-win-x64.exe
@echo b94756c56cdf505ad272d435e145a67b3aa3c518fb34c78e37d769a7b69a0f5f259cb9a51bb28c26f070d0950ff766ea57a99d477da7b606b83728783708f1b9 *8-0\dotnet-runtime-8.0.16-win-x86.exe
@echo 8c61220263b0d5640cb5c5499652fff5a99bbe9930d95d42943eb336cff80ecc7e00a7f6304d992da8016f5e8bacaac5323ecab92aa2e2cdf214c4e8425aef4f *8-0\dotnet-runtime-8.0.16-win-x64.exe
@echo 0a51c551ebeb46795be2aef9785c09f5ce03caf5da730e9ccea4bf58075668e84fed91ce741dec1953942c07e2790990005a24ee0fa5c82504dadcf615639677 *8-0\dotnet-runtime-8.0.16-win-x86.zip
@echo 096632e933c94413316c7f7d54541cfbec76d0d77776bfdeda1cb155567a6eaefb33bcdd1e36d9add3bb0f276418b3615782489be3e1cb9e628138c8b91c23e2 *8-0\dotnet-runtime-8.0.16-win-x64.zip
@echo cfdf8369b3ac1c8fcba3274cb716c9faaa1df489ec3d3fd77419e78a0d740588546269ab7d77e09b3d4fe3817c55ca63c909d259ab7fe8b33da351453b58a05b *7-0\windowsdesktop-runtime-7.0.20-win-x86.exe
@echo a0ed41e1672a25a9ee2cf3ca081e90f037b889100dbf8312e277447a801a4f3b7af464fa05fb796a24f89cd119102e8d0a382f4711e4e6263e5503642231da88 *7-0\windowsdesktop-runtime-7.0.20-win-x64.exe
@echo b8d5e8dfd844bbdd9cf83c512f015d06bd326e17fb9d250ef8d02a8f4adb6bbfa1ec6ab1a49c7a72ec608cad90da4f1f8e6b1d1129b9d53bb2036ee5c6cfaead *7-0\dotnet-runtime-7.0.20-win-x86.exe
@echo 89a537a0ff92520cc543b4ee0a702063266aeb5d4d302e276fa9c8898ebf39bdc7bec134aa206bab8ef0ead395c79ab2e173abb8b506431f3cef641d8b7ecf11 *7-0\dotnet-runtime-7.0.20-win-x64.exe
@echo f4cf05a03b7e568f974202379f662becd8756b8d6755277c19247130d03ce7b5062a6414904bdc52256aa2373501dfc62f3615aea0f92b5e192bb8e11009fdf9 *7-0\dotnet-runtime-7.0.20-win-x86.zip
@echo 4943862d33d3c483396adae24c932d254b218aaaa4638e47b22bdd1d61eea248f90f5a768a0842b8c743db8b96039506941af6384411e8c891aeefdebd7db4fd *7-0\dotnet-runtime-7.0.20-win-x64.zip
@echo a18351aabfe1590e58af79e57ac2414254ba80cb7a1fef19545a6b8418575c735fc1dc164c3c7fed426c4698f099991487fa4f443bab93afd41d1563845fbcf4 *6-0\windowsdesktop-runtime-6.0.36-win-x86.exe
@echo 86fa63997e7e0dc6f3bf609e00880388dcf8d985c8f6417d07ebbbb1ecc957bf90214c8ff93f559a0e762b5626ba8c56c581f4d506aa4de7555f9792c2da254d *6-0\windowsdesktop-runtime-6.0.36-win-x64.exe
@echo 53b3ad92bdb61478b3c96d85c6c54edfdb472da33c44f9d173ee309bbb92c67fd089c2cd10249c9562118876d033e0d55794eb98ef3641c1532bb5a42926a4a8 *6-0\dotnet-runtime-6.0.36-win-x86.exe
@echo a8e493587d741dfc5ab3aeb548e8abae1bc180dfa28cc0aa4ddaf159bdd990644a97d5e987a17e25def1a41947938b0fabcfe35cf9d81df29b2619b54ec3a86c *6-0\dotnet-runtime-6.0.36-win-x64.exe
@echo 1d7ecca39d4d14c27b067358c433ebf90dde716e5c4bdc244861dc7268b23f172d61bf910a4e16b46e4d629f23774b8311ba8d5a45085d995da4ef25b74c75ea *6-0\dotnet-runtime-6.0.36-win-x86.zip
@echo 935db5c6cee19f2c016e67168bfae7b491044735de76c673abb3b125dd325fd5e779d7efe12ba80178d46689ae70a25e558a3fa846417d44c5f4ca256e7f4bf2 *6-0\dotnet-runtime-6.0.36-win-x64.zip
@echo 74a379323e52172f563cd996880f58d58a19303ae59b3f55ff52625dfe8a4a602609785b1174b38f2da97282f90f1ade53194354f48773512943eae249926ee8 *5-0\windowsdesktop-runtime-5.0.17-win-x86.exe
@echo f7eb69a953ff6346a180e5200075120b4b47cb89a75bc36c76a9e468c037bb2376f497dbf8e0bada152bc3ec35dceaad55d0a811586569575bf5b201d1e32baf *5-0\windowsdesktop-runtime-5.0.17-win-x64.exe
@echo fb615e36ac159b860b2a22b21570653137ee7ceaa3844204ad468b8a94e31f7ea70232cea3ab3f77a53d56c35d2a3e33e5d20049ef3a31bcad4bbfb3e8798f44 *5-0\dotnet-runtime-5.0.17-win-x86.exe
@echo 717ec8056cf6e0f9f7cb8851929b598e860f3962575a34e625e3bcf9a9ff1366965ed9cb0d4e93e7330c31afea9c8a727a18fb10f666dd5f43126da439be2ec5 *5-0\dotnet-runtime-5.0.17-win-x64.exe
@echo 8983fcdbc302f5e04cc76ce02f2e6c1f011d88534e85f461264e35ed303a072cfa05ca81a794a9aac396c0393d08d55567a7a9c3f7e50e05940e618b0064b9bd *5-0\dotnet-runtime-5.0.17-win-x86.zip
@echo 424df2b535f73c40aea164623a8a8f549bd18f89406eb2cb84289cb4cfceb3450db7762c5582756263d79ed628a574730e708d87dc906fd2c00d29f64942c782 *5-0\dotnet-runtime-5.0.17-win-x64.zip
)>sha.sha

@echo+
@echo Done!
@pause > nul
