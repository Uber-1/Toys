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
@echo 8.0.1
@echo https://dotnet.microsoft.com/en-us/download/dotnet/8.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/ca725693-6de7-4a4d-b8a4-4390b0387c66/ce13f2f016152d9b5f2d3c6537cc415b/windowsdesktop-runtime-8.0.1-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/f18288f6-1732-415b-b577-7fb46510479a/a98239f751a7aed31bc4aa12f348a9bf/windowsdesktop-runtime-8.0.1-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/8c884ea1-2ae5-4359-82a4-8ce8fb309b0e/53a67e660c7b331577c95b02f87935fe/dotnet-runtime-8.0.1-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/cede7e69-dbd4-4908-9bfb-12fa4660e2b9/d9ed17179d0275abee5afd29d5460b48/dotnet-runtime-8.0.1-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/edd19f6e-419b-4ce6-8c58-eced8309bda3/98ae2907a522f3bdf8ee700c2e0daf50/dotnet-runtime-8.0.1-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/eac51dde-7bac-4bdb-aacd-e8c870f29aa4/d6c945e85adab9af2446856f90f6d326/dotnet-runtime-8.0.1-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/ca725693-6de7-4a4d-b8a4-4390b0387c66/ce13f2f016152d9b5f2d3c6537cc415b/windowsdesktop-runtime-8.0.1-win-x86.exe', 'windowsdesktop-runtime-8.0.1-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/f18288f6-1732-415b-b577-7fb46510479a/a98239f751a7aed31bc4aa12f348a9bf/windowsdesktop-runtime-8.0.1-win-x64.exe', 'windowsdesktop-runtime-8.0.1-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/8c884ea1-2ae5-4359-82a4-8ce8fb309b0e/53a67e660c7b331577c95b02f87935fe/dotnet-runtime-8.0.1-win-x86.exe', 'dotnet-runtime-8.0.1-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/cede7e69-dbd4-4908-9bfb-12fa4660e2b9/d9ed17179d0275abee5afd29d5460b48/dotnet-runtime-8.0.1-win-x64.exe', 'dotnet-runtime-8.0.1-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/edd19f6e-419b-4ce6-8c58-eced8309bda3/98ae2907a522f3bdf8ee700c2e0daf50/dotnet-runtime-8.0.1-win-x86.zip', 'dotnet-runtime-8.0.1-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/eac51dde-7bac-4bdb-aacd-e8c870f29aa4/d6c945e85adab9af2446856f90f6d326/dotnet-runtime-8.0.1-win-x64.zip', 'dotnet-runtime-8.0.1-win-x64.zip')"
)
@md 8-0 &@move "*8.0*.*" "8-0\"

@echo+
@echo 7.0.15
@echo https://dotnet.microsoft.com/en-us/download/dotnet/7.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/fd3675e7-91e6-4fce-9c77-9336a4973e42/e970987509babd919e8ea29309054c8c/windowsdesktop-runtime-7.0.15-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/00f765dd-f009-41b4-921f-bee1273f3638/3cb6ac95b2aa7eeb272c6179d56fd036/windowsdesktop-runtime-7.0.15-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/a0b41d8a-5de8-4dbc-b72b-6c52edf5727e/0b9b3b50a325c1b82ec17a5b63e92ea2/dotnet-runtime-7.0.15-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/83b58670-c0ea-4442-ad35-beb5009f5396/bcf1e10f57dbeea2f46490430abf6882/dotnet-runtime-7.0.15-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/1effd491-0dbe-4669-be8f-401405447705/0480e379b6bc5fbd5e68f6d3f23fbeda/dotnet-runtime-7.0.15-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/b5ed1321-d9fd-41aa-aa75-c26edf0b0e6b/0818675fe18a1f566cb3eff2d040b959/dotnet-runtime-7.0.15-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/fd3675e7-91e6-4fce-9c77-9336a4973e42/e970987509babd919e8ea29309054c8c/windowsdesktop-runtime-7.0.15-win-x86.exe', 'windowsdesktop-runtime-7.0.15-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/00f765dd-f009-41b4-921f-bee1273f3638/3cb6ac95b2aa7eeb272c6179d56fd036/windowsdesktop-runtime-7.0.15-win-x64.exe', 'windowsdesktop-runtime-7.0.15-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/a0b41d8a-5de8-4dbc-b72b-6c52edf5727e/0b9b3b50a325c1b82ec17a5b63e92ea2/dotnet-runtime-7.0.15-win-x86.exe', 'dotnet-runtime-7.0.15-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/83b58670-c0ea-4442-ad35-beb5009f5396/bcf1e10f57dbeea2f46490430abf6882/dotnet-runtime-7.0.15-win-x64.exe', 'dotnet-runtime-7.0.15-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/1effd491-0dbe-4669-be8f-401405447705/0480e379b6bc5fbd5e68f6d3f23fbeda/dotnet-runtime-7.0.15-win-x86.zip', 'dotnet-runtime-7.0.15-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/b5ed1321-d9fd-41aa-aa75-c26edf0b0e6b/0818675fe18a1f566cb3eff2d040b959/dotnet-runtime-7.0.15-win-x64.zip', 'dotnet-runtime-7.0.15-win-x64.zip')"
)
@md 7-0 &@move "*7.0*.*" "7-0\"

@echo+
@echo 6.0.26
@echo https://dotnet.microsoft.com/en-us/download/dotnet/6.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/d6835aa3-6ec4-47ec-a5a5-9052ed310e4f/c1171996e95717bf532475f4546e479c/windowsdesktop-runtime-6.0.26-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/3136e217-e5b7-4899-9b7e-aa52ecb8b108/d74134edaa75e3300f8692660b9fb7b5/windowsdesktop-runtime-6.0.26-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/b9e43719-f3ce-4b04-9012-db2761d86407/a726c1eac3b8c2086a067406dae91bfa/dotnet-runtime-6.0.26-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/7d3cdd04-9db8-41db-bc86-4af63f9edd4a/8899ff776eed41b3f5376bfc09913c36/dotnet-runtime-6.0.26-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/db577d7b-2b22-482e-a1ba-b9b3e0ea92ca/186b7a3bbf919b3449bf31e2cc35e000/dotnet-runtime-6.0.26-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/62025cf7-35ad-4be2-a3dd-fc865f038c65/bfa6ccaa29f57797ca518c7110624209/dotnet-runtime-6.0.26-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/d6835aa3-6ec4-47ec-a5a5-9052ed310e4f/c1171996e95717bf532475f4546e479c/windowsdesktop-runtime-6.0.26-win-x86.exe', 'windowsdesktop-runtime-6.0.26-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/3136e217-e5b7-4899-9b7e-aa52ecb8b108/d74134edaa75e3300f8692660b9fb7b5/windowsdesktop-runtime-6.0.26-win-x64.exe', 'windowsdesktop-runtime-6.0.26-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/b9e43719-f3ce-4b04-9012-db2761d86407/a726c1eac3b8c2086a067406dae91bfa/dotnet-runtime-6.0.26-win-x86.exe', 'dotnet-runtime-6.0.26-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/7d3cdd04-9db8-41db-bc86-4af63f9edd4a/8899ff776eed41b3f5376bfc09913c36/dotnet-runtime-6.0.26-win-x64.exe', 'dotnet-runtime-6.0.26-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/db577d7b-2b22-482e-a1ba-b9b3e0ea92ca/186b7a3bbf919b3449bf31e2cc35e000/dotnet-runtime-6.0.26-win-x86.zip', 'dotnet-runtime-6.0.26-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/62025cf7-35ad-4be2-a3dd-fc865f038c65/bfa6ccaa29f57797ca518c7110624209/dotnet-runtime-6.0.26-win-x64.zip', 'dotnet-runtime-6.0.26-win-x64.zip')"
)
@md 6-0 &@move "*6.0*.*" "6-0\"

@echo+
@echo 5.0.17
@echo https://dotnet.microsoft.com/en-us/download/dotnet/5.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/b6fe5f2a-95f4-46f1-9824-f5994f10bc69/db5ec9b47ec877b5276f83a185fdb6a0/windowsdesktop-runtime-5.0.17-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/3aa4e942-42cd-4bf5-afe7-fc23bd9c69c5/64da54c8864e473c19a7d3de15790418/windowsdesktop-runtime-5.0.17-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/54683c13-6b04-4d7d-b4d4-1f055b50ea43/e99048e2840d57040e8312058853a5b9/dotnet-runtime-5.0.17-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/a0832b5a-6900-442b-af79-6ffddddd6ba4/e2df0b25dd851ee0b38a86947dd0e42e/dotnet-runtime-5.0.17-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/af4e7d6a-2484-4288-80a6-2e96b06e4331/c303434225858e18f08fca2ef166c634/dotnet-runtime-5.0.17-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/a81ee543-fafc-4c62-85a6-c9eab5d0ef8d/a533bf7448b59bf05788b18faada5311/dotnet-runtime-5.0.17-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/b6fe5f2a-95f4-46f1-9824-f5994f10bc69/db5ec9b47ec877b5276f83a185fdb6a0/windowsdesktop-runtime-5.0.17-win-x86.exe', 'windowsdesktop-runtime-5.0.17-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/3aa4e942-42cd-4bf5-afe7-fc23bd9c69c5/64da54c8864e473c19a7d3de15790418/windowsdesktop-runtime-5.0.17-win-x64.exe', 'windowsdesktop-runtime-5.0.17-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/54683c13-6b04-4d7d-b4d4-1f055b50ea43/e99048e2840d57040e8312058853a5b9/dotnet-runtime-5.0.17-win-x86.exe', 'dotnet-runtime-5.0.17-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/a0832b5a-6900-442b-af79-6ffddddd6ba4/e2df0b25dd851ee0b38a86947dd0e42e/dotnet-runtime-5.0.17-win-x64.exe', 'dotnet-runtime-5.0.17-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/af4e7d6a-2484-4288-80a6-2e96b06e4331/c303434225858e18f08fca2ef166c634/dotnet-runtime-5.0.17-win-x86.zip', 'dotnet-runtime-5.0.17-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/a81ee543-fafc-4c62-85a6-c9eab5d0ef8d/a533bf7448b59bf05788b18faada5311/dotnet-runtime-5.0.17-win-x64.zip', 'dotnet-runtime-5.0.17-win-x64.zip')"
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
@echo 1d2cdb417ff9d72e4766255a1d7568bc16348120c72db58a020f35917b47a0f39dd74e185371668419a9f8a4fc2e9aad4073b5dcb273d010fbf9b16a718d018d *8-0\windowsdesktop-runtime-8.0.1-win-x86.exe
@echo 233d98b280eb4353fff7e45fa45e0de510403853e881c0bdcd3eb2466df4930795a62fec14cb30d05e00bff37f17b4d6c9b95511ca71475b739d6d9be9d2ebab *8-0\windowsdesktop-runtime-8.0.1-win-x64.exe
@echo cbcab96d341a3d49da8cdce87aa7c23ee2186c36408cf90b61636ab0417720b203a83e1699ccda34b2c4097019384e9add62b621d623528688896e441b04306a *8-0\dotnet-runtime-8.0.1-win-x86.exe
@echo 46f2561197aa33f6fd33d40943f2c76d1b8d5c7ace39ba5555d9eda6cc4ac3f8cbae10b353cce9c7a7b4fdb30f2b6d1897461811880271e07555982100270347 *8-0\dotnet-runtime-8.0.1-win-x64.exe
@echo 8784ce84e0c51687bbbb839bd03c20f4526c6c29fbb7e52e465fcff4b31257bf2833e77ca529251f311406328d7b05433b9b9994a39bff74efe468bc4cd4d000 *8-0\dotnet-runtime-8.0.1-win-x86.zip
@echo 21608914ccb6d872ce8a9a66ab37af1fed4e52e01f0b2a1f7fbea077f8d8cfc287d2d7a761049727d948c25dfc5bfbfa0aace8541d553a67ef8bd06fc215b803 *8-0\dotnet-runtime-8.0.1-win-x64.zip
@echo f749fbb22ae6daf5370f2d8c0961af049a723b742805a5a36dc2288f0318ceb600551ff72fa79aaa393b22a207165c92aa2de918c7215b6f4caa7fb679a3df69 *7-0\windowsdesktop-runtime-7.0.15-win-x86.exe
@echo 9fcf6fe4a49ccac84fced899039522eee06210cb7d7add57d2c4f76560a4698f38ce22305d13f129a535fc105e3e7e132b90f9b9aadeaffae076f037c891813b *7-0\windowsdesktop-runtime-7.0.15-win-x64.exe
@echo ed3eff487868e46a8de1f65a7519692eb2fd96ed015da6560446c443c7c201eaf4cd68a6a1a1401dc692cbc725e77f3d5c530f76fe86778240793245e95e6885 *7-0\dotnet-runtime-7.0.15-win-x86.exe
@echo c7509c8893824988721ef8498cdd1d687de2b5e39fc210bc49a1da6f45e22d6c8a9a9836f3509361bf9e9376a25014cfbcbc74469359d06dcf5eab549c11598d *7-0\dotnet-runtime-7.0.15-win-x64.exe
@echo f5f329d3cbbca99e18f5718074761138b4ca040cc3981e87a3042a1e52f2d7e2c58c7612d2b4c008a47cbf6b0ddddee85ff1a7237ff7a63ac564fb739f8da7e9 *7-0\dotnet-runtime-7.0.15-win-x86.zip
@echo 441a8d93af6603ebc1a315dad8f87bffb3b13c8042f7aaaede0ede235a9313a2106951f390d856dfc6ff228e025cb655a3eca757413a239113398bd1f77d7f04 *7-0\dotnet-runtime-7.0.15-win-x64.zip
@echo bd0878b65750173e2d99479ae051daa9e71a0ee1949c600ed4a33856e4bdd2b658ebbd1439977d17c0d2fd8f3bb37c1592c4f46a4def9c534addac3a9f4a72a2 *6-0\windowsdesktop-runtime-6.0.26-win-x86.exe
@echo 7dd45e746fb0b82c13b91559ac25a39b66b9c94c22e5f9bd91b1dceaff96922b1da2fed152ec36e15f2c7a38e0180508f81807930928c5d0aea225f117a108c4 *6-0\windowsdesktop-runtime-6.0.26-win-x64.exe
@echo 2dc212f6db2ac43f1bd69adbad48f1d38d5714b92ba1e1a9aa5bb3b76efa4a359851ffdacff74d5be2258ea2632a56c0bdd64d63d44c6f7a6854488fbf4baa28 *6-0\dotnet-runtime-6.0.26-win-x86.exe
@echo 3ca5c85db44c19e8b96cb7d1e40cc6cd8303c81450fac7e1036823bd2321dba0e5cb184642b396ae9d41abd10b4c048daf69c5b9632e39c8e93768bb65d97bf7 *6-0\dotnet-runtime-6.0.26-win-x64.exe
@echo 70d455eb5ac1baf7ad7115cb67dcc104c1957e42ff8285a095907895fc82d16e965d06831eb91ce023a5b6fa764437d19c2a73c6c8bcd3cc582aec15e3c7e4c1 *6-0\dotnet-runtime-6.0.26-win-x86.zip
@echo 94c3f6d22e5b47066bcf4abe85279dc2f0bff05031adeaad4a3ec9600f27959d3e56d40c5a23b0b8565e028207473ca0383e686f1f198994e2b263b9825d2d35 *6-0\dotnet-runtime-6.0.26-win-x64.zip
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
