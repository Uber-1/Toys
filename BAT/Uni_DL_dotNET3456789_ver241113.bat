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
@echo 9.0.0
@echo https://dotnet.microsoft.com/en-us/download/dotnet/9.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/8dfbde7b-c316-418d-934a-d3246253f342/69c6a35b77a4f01b95588e1df2bddf9a/windowsdesktop-runtime-9.0.0-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/685792b6-4827-4dca-a971-bce5d7905170/1bf61b02151bc56e763dc711e45f0e1e/windowsdesktop-runtime-9.0.0-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/0e89cce9-dc02-423c-a657-0c2b421edf21/af2e916785775fe7e023b953af404db5/dotnet-runtime-9.0.0-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/99bd07c2-c95c-44dc-9d47-36d3b18df240/bdf26c62f69c1b783687c1dce83ccf7a/dotnet-runtime-9.0.0-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/73b2d717-c521-47cf-857e-e353f05f3b83/db5484cdaef7f85c94b484fbeb42299d/dotnet-runtime-9.0.0-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/fed1ee33-4574-4d89-85b5-3b8d7762b56a/432725cb9d6d235424768defea5ce6ee/dotnet-runtime-9.0.0-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/8dfbde7b-c316-418d-934a-d3246253f342/69c6a35b77a4f01b95588e1df2bddf9a/windowsdesktop-runtime-9.0.0-win-x86.exe', 'windowsdesktop-runtime-9.0.0-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/685792b6-4827-4dca-a971-bce5d7905170/1bf61b02151bc56e763dc711e45f0e1e/windowsdesktop-runtime-9.0.0-win-x64.exe', 'windowsdesktop-runtime-9.0.0-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/0e89cce9-dc02-423c-a657-0c2b421edf21/af2e916785775fe7e023b953af404db5/dotnet-runtime-9.0.0-win-x86.exe', 'dotnet-runtime-9.0.0-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/99bd07c2-c95c-44dc-9d47-36d3b18df240/bdf26c62f69c1b783687c1dce83ccf7a/dotnet-runtime-9.0.0-win-x64.exe', 'dotnet-runtime-9.0.0-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/73b2d717-c521-47cf-857e-e353f05f3b83/db5484cdaef7f85c94b484fbeb42299d/dotnet-runtime-9.0.0-win-x86.zip', 'dotnet-runtime-9.0.0-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/9.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/fed1ee33-4574-4d89-85b5-3b8d7762b56a/432725cb9d6d235424768defea5ce6ee/dotnet-runtime-9.0.0-win-x64.zip', 'dotnet-runtime-9.0.0-win-x64.zip')"
)
@md 9-0 &@move "*9.0*.*" "9-0\"

@echo+
@echo 8.0.11
@echo https://dotnet.microsoft.com/en-us/download/dotnet/8.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/6e1f5faf-ee7d-4db0-9111-9e270a458342/4cdcd1af2d6914134308630f048fbdfc/windowsdesktop-runtime-8.0.11-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/27bcdd70-ce64-4049-ba24-2b14f9267729/d4a435e55182ce5424a7204c2cf2b3ea/windowsdesktop-runtime-8.0.11-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/a8d1a489-60d6-4e63-93ee-ab9c44d78b0d/5519f99ff50de6e096bb1d266dd0e667/dotnet-runtime-8.0.11-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/53e9e41c-b362-4598-9985-45f989518016/53c5e1919ba2fe23273f2abaff65595b/dotnet-runtime-8.0.11-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/34670006-7e69-4750-9012-cf1e15bc83d1/c4c887089dbea784726b26facaae336a/dotnet-runtime-8.0.11-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/92f9abc6-1e19-40cd-82cf-670be98d3533/46e1346503f4b54418bf9d5f861f1d43/dotnet-runtime-8.0.11-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/6e1f5faf-ee7d-4db0-9111-9e270a458342/4cdcd1af2d6914134308630f048fbdfc/windowsdesktop-runtime-8.0.11-win-x86.exe', 'windowsdesktop-runtime-8.0.11-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/27bcdd70-ce64-4049-ba24-2b14f9267729/d4a435e55182ce5424a7204c2cf2b3ea/windowsdesktop-runtime-8.0.11-win-x64.exe', 'windowsdesktop-runtime-8.0.11-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/a8d1a489-60d6-4e63-93ee-ab9c44d78b0d/5519f99ff50de6e096bb1d266dd0e667/dotnet-runtime-8.0.11-win-x86.exe', 'dotnet-runtime-8.0.11-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/53e9e41c-b362-4598-9985-45f989518016/53c5e1919ba2fe23273f2abaff65595b/dotnet-runtime-8.0.11-win-x64.exe', 'dotnet-runtime-8.0.11-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/34670006-7e69-4750-9012-cf1e15bc83d1/c4c887089dbea784726b26facaae336a/dotnet-runtime-8.0.11-win-x86.zip', 'dotnet-runtime-8.0.11-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/92f9abc6-1e19-40cd-82cf-670be98d3533/46e1346503f4b54418bf9d5f861f1d43/dotnet-runtime-8.0.11-win-x64.zip', 'dotnet-runtime-8.0.11-win-x64.zip')"
)
@md 8-0 &@move "*8.0*.*" "8-0\"

@echo+
@echo 7.0.20
@echo https://dotnet.microsoft.com/en-us/download/dotnet/7.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/b840017b-c69f-4724-a152-11020a0039e6/b74aa12e4ee765a3387a7dcd4ba56187/windowsdesktop-runtime-7.0.20-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/08bbfe8f-812d-479f-803b-23ea0bffce47/c320e4b037f3e92ab7ea92c3d7ea3ca1/windowsdesktop-runtime-7.0.20-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/b2e820bd-b591-43df-ab10-1eeb7998cc18/661ca79db4934c6247f5c7a809a62238/dotnet-runtime-7.0.20-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/be7eaed0-4e32-472b-b53e-b08ac3433a22/fc99a5977c57cbfb93b4afb401953818/dotnet-runtime-7.0.20-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/f479b75e-9ecb-42ea-8371-c94f411eda8d/0cd700d75f1d04e9108bc4213f8a41ec/dotnet-runtime-7.0.20-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/990ff1f7-b5df-4a80-a65e-7cff3a1a263c/f1a2f3cab0d1787618f7d8043e3a6827/dotnet-runtime-7.0.20-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/b840017b-c69f-4724-a152-11020a0039e6/b74aa12e4ee765a3387a7dcd4ba56187/windowsdesktop-runtime-7.0.20-win-x86.exe', 'windowsdesktop-runtime-7.0.20-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/08bbfe8f-812d-479f-803b-23ea0bffce47/c320e4b037f3e92ab7ea92c3d7ea3ca1/windowsdesktop-runtime-7.0.20-win-x64.exe', 'windowsdesktop-runtime-7.0.20-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/b2e820bd-b591-43df-ab10-1eeb7998cc18/661ca79db4934c6247f5c7a809a62238/dotnet-runtime-7.0.20-win-x86.exe', 'dotnet-runtime-7.0.20-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/be7eaed0-4e32-472b-b53e-b08ac3433a22/fc99a5977c57cbfb93b4afb401953818/dotnet-runtime-7.0.20-win-x64.exe', 'dotnet-runtime-7.0.20-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/f479b75e-9ecb-42ea-8371-c94f411eda8d/0cd700d75f1d04e9108bc4213f8a41ec/dotnet-runtime-7.0.20-win-x86.zip', 'dotnet-runtime-7.0.20-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/990ff1f7-b5df-4a80-a65e-7cff3a1a263c/f1a2f3cab0d1787618f7d8043e3a6827/dotnet-runtime-7.0.20-win-x64.zip', 'dotnet-runtime-7.0.20-win-x64.zip')"
)
@md 7-0 &@move "*7.0*.*" "7-0\"

@echo+
@echo 6.0.36
@echo https://dotnet.microsoft.com/en-us/download/dotnet/6.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/cdc314df-4a4c-4709-868d-b974f336f77f/acd5ab7637e456c8a3aa667661324f6d/windowsdesktop-runtime-6.0.36-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/f6b6c5dc-e02d-4738-9559-296e938dabcb/b66d365729359df8e8ea131197715076/windowsdesktop-runtime-6.0.36-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/727d79cb-6a4c-4a6b-bd9e-af99ad62de0b/5cd3550f1589a2f1b3a240c745dd1023/dotnet-runtime-6.0.36-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/1a5fc50a-9222-4f33-8f73-3c78485a55c7/1cb55899b68fcb9d98d206ba56f28b66/dotnet-runtime-6.0.36-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/0cc3f564-be24-4a10-8071-786859e768f9/8d5dd547565a37e93dee27f741c0c847/dotnet-runtime-6.0.36-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/268f4e36-89a9-42bb-905e-777014173306/061b9dfad5c34f7d262ea82c20396b7f/dotnet-runtime-6.0.36-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/cdc314df-4a4c-4709-868d-b974f336f77f/acd5ab7637e456c8a3aa667661324f6d/windowsdesktop-runtime-6.0.36-win-x86.exe', 'windowsdesktop-runtime-6.0.36-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/f6b6c5dc-e02d-4738-9559-296e938dabcb/b66d365729359df8e8ea131197715076/windowsdesktop-runtime-6.0.36-win-x64.exe', 'windowsdesktop-runtime-6.0.36-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/727d79cb-6a4c-4a6b-bd9e-af99ad62de0b/5cd3550f1589a2f1b3a240c745dd1023/dotnet-runtime-6.0.36-win-x86.exe', 'dotnet-runtime-6.0.36-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/1a5fc50a-9222-4f33-8f73-3c78485a55c7/1cb55899b68fcb9d98d206ba56f28b66/dotnet-runtime-6.0.36-win-x64.exe', 'dotnet-runtime-6.0.36-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/0cc3f564-be24-4a10-8071-786859e768f9/8d5dd547565a37e93dee27f741c0c847/dotnet-runtime-6.0.36-win-x86.zip', 'dotnet-runtime-6.0.36-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/268f4e36-89a9-42bb-905e-777014173306/061b9dfad5c34f7d262ea82c20396b7f/dotnet-runtime-6.0.36-win-x64.zip', 'dotnet-runtime-6.0.36-win-x64.zip')"
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
@echo f597d55205b776391ac1aeb56c40abf5274e6473193c4e6c48982582c135db199d8e75adba87bdacca8981752f04f596105548ab9cc267139e681c7858890543 *9-0\windowsdesktop-runtime-9.0.0-win-x86.exe
@echo e48e015327598623cac9081a556f76f4d4d74c33e35a7cecbd2989a5b2bcb6575017e922883fc841e10efdec3d9577a47ed2b036b7f431d8f8442bb1066e72ac *9-0\windowsdesktop-runtime-9.0.0-win-x64.exe
@echo 7d744cedfc81f911b51ac05741a77953a18d1415bc7c1667fd8fa8e89b4a0df597046f25a82a960bf65e7e7fe453edf87aacc25abd6bb05d0b289adedd6b2ab1 *9-0\dotnet-runtime-9.0.0-win-x86.exe
@echo 97334bbe82e2d6db090279b178d0bdfb1d675e0fcd9ca0c951bbcac05598b0424f66eb74599eb8d1a6790699a931974924f79815941944f440a261dce2cd9ca1 *9-0\dotnet-runtime-9.0.0-win-x64.exe
@echo dc345e64174a9bec4bf9c27d6a80c946aec3a418a7ac42e2ed9c20737c014cb0b1dbce3bd33eb6cce211ebf60ddcb0e13e1d60051017e4c0c11bd6ab4fda1c80 *9-0\dotnet-runtime-9.0.0-win-x86.zip
@echo 23ae6ce34fe1271a5a48675a9cb7ed728af4be4014a7ee4a6a60a84fc23e55b50a5cafd7ec20197bd73ee47901e4239e0c4cd8fd0f5deeb34cc3da1de3960e46 *9-0\dotnet-runtime-9.0.0-win-x64.zip
@echo 32d11f33394ea1662a23046c45c224d60b25897951072d00324f6a9a297960086e3b8c606018ef947f40b19b570f7335e18fe8481bcaf6edba4a349285be8186 *8-0\windowsdesktop-runtime-8.0.11-win-x86.exe
@echo fd6f0ac18e77f92b78c41aa2f3e19b9d1de6e63a0e4a517c897e68dafa5131f734d39f0b1dc9ea09a3b0949805d72ef6f82efb1f6a689ab055048705f43cff7b *8-0\windowsdesktop-runtime-8.0.11-win-x64.exe
@echo b438ec56b89c3b1f0506e2c0b11d54330c7090f44a2bcc54b834544f8fc0e68b24bf926d33b4b5933d2749a135b6c71b9a9e0dc7ac0808e45fa85047ef7791ab *8-0\dotnet-runtime-8.0.11-win-x86.exe
@echo dcd4e61239389e51fa3679244df29cbbf43ddd0305546479d64c5e1da3c0f4322f60a0af56375a2d3e0951c973546dbf81c0268be53291aadd5a36c65c3f901f *8-0\dotnet-runtime-8.0.11-win-x64.exe
@echo cb80a41ea64db17f2cc21390fefeac7342e965fba3bb6f768c51fdcf7271fbd1399eaaf33ec1162bc206e47bc8d296d28ddad2139c8a770d02e62fa90af49a32 *8-0\dotnet-runtime-8.0.11-win-x86.zip
@echo a0ed92b8ffeb4efb61a93c3cb7c1ed66529e23cbe60b44d621b49b1cb90159866a3d921630485fc0e2b1660b2001f73752c6fa6fc9dca40145ef4549dd26a1ab *8-0\dotnet-runtime-8.0.11-win-x64.zip
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
