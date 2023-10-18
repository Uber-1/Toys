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
@echo 8.0.0-rc.2
@echo https://dotnet.microsoft.com/en-us/download/dotnet/8.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/c2d2d578-40f2-4055-bf2f-77aec390e710/5dd9089e2fc23e7e87e8a691489cf617/windowsdesktop-runtime-8.0.0-rc.2.23479.10-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/9c540179-a75c-4418-94fd-3bfe580e4251/6560fb0d71bf6434a4fe17b5cfa00a45/windowsdesktop-runtime-8.0.0-rc.2.23479.10-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/a69b7628-d127-4dff-a808-3da5d7554896/95123b7c28d55ea34f59f9b88f54bcfe/dotnet-runtime-8.0.0-rc.2.23479.6-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/aebdca89-6bdc-4d2b-8f50-96abd8a21308/1949f6958ea40fd143009059ab3e8efc/dotnet-runtime-8.0.0-rc.2.23479.6-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/9bf45c99-29cf-43ce-be4f-12cea5cad888/2236415a0515db0ce9b5c80d1ad994cc/dotnet-runtime-8.0.0-rc.2.23479.6-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/986289ec-503e-4cdd-bd6d-bb3aae442177/26a18571e620007b90067361618a622b/dotnet-runtime-8.0.0-rc.2.23479.6-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/c2d2d578-40f2-4055-bf2f-77aec390e710/5dd9089e2fc23e7e87e8a691489cf617/windowsdesktop-runtime-8.0.0-rc.2.23479.10-win-x86.exe', 'windowsdesktop-runtime-8.0.0-rc.2-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/9c540179-a75c-4418-94fd-3bfe580e4251/6560fb0d71bf6434a4fe17b5cfa00a45/windowsdesktop-runtime-8.0.0-rc.2.23479.10-win-x64.exe', 'windowsdesktop-runtime-8.0.0-rc.2-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/a69b7628-d127-4dff-a808-3da5d7554896/95123b7c28d55ea34f59f9b88f54bcfe/dotnet-runtime-8.0.0-rc.2.23479.6-win-x86.exe', 'dotnet-runtime-8.0.0-rc.2-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/aebdca89-6bdc-4d2b-8f50-96abd8a21308/1949f6958ea40fd143009059ab3e8efc/dotnet-runtime-8.0.0-rc.2.23479.6-win-x64.exe', 'dotnet-runtime-8.0.0-rc.2-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/9bf45c99-29cf-43ce-be4f-12cea5cad888/2236415a0515db0ce9b5c80d1ad994cc/dotnet-runtime-8.0.0-rc.2.23479.6-win-x86.zip', 'dotnet-runtime-8.0.0-rc.2-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/986289ec-503e-4cdd-bd6d-bb3aae442177/26a18571e620007b90067361618a622b/dotnet-runtime-8.0.0-rc.2.23479.6-win-x64.zip', 'dotnet-runtime-8.0.0-rc.2-win-x64.zip')"
)
@md 8-0 &@move "*8.0*.*" "8-0\"

@echo+
@echo 7.0.12
@echo https://dotnet.microsoft.com/en-us/download/dotnet/7.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/7e606599-560e-47c9-9ff1-60af4beaffb5/377fdff249559470cf483880f16acaf0/windowsdesktop-runtime-7.0.12-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/f9ea536d-8e1f-4247-88b8-e79e33fa0873/c06e39f73a3bb1ec8833bb1cde98fce3/windowsdesktop-runtime-7.0.12-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/fc5aab43-a18e-4cdc-bdaf-a26a09bfdac2/d7ccd0e3180d0bcf5700ea77cadb409d/dotnet-runtime-7.0.12-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/1d1b78d3-b079-4b47-9b17-f3def75babad/6a66a2c9ad5ee028ae35dd8d6a3add1a/dotnet-runtime-7.0.12-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/e6be672b-53a9-4050-9b55-53f74a55523c/b59ab5af9be85681cf415865a159624f/dotnet-runtime-7.0.12-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/6d97a102-c4f3-4183-91d7-d810e96e73a1/272349ea2adf0145d9364e2c12bd23a4/dotnet-runtime-7.0.12-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/7e606599-560e-47c9-9ff1-60af4beaffb5/377fdff249559470cf483880f16acaf0/windowsdesktop-runtime-7.0.12-win-x86.exe', 'windowsdesktop-runtime-7.0.12-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/f9ea536d-8e1f-4247-88b8-e79e33fa0873/c06e39f73a3bb1ec8833bb1cde98fce3/windowsdesktop-runtime-7.0.12-win-x64.exe', 'windowsdesktop-runtime-7.0.12-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/fc5aab43-a18e-4cdc-bdaf-a26a09bfdac2/d7ccd0e3180d0bcf5700ea77cadb409d/dotnet-runtime-7.0.12-win-x86.exe', 'dotnet-runtime-7.0.12-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/1d1b78d3-b079-4b47-9b17-f3def75babad/6a66a2c9ad5ee028ae35dd8d6a3add1a/dotnet-runtime-7.0.12-win-x64.exe', 'dotnet-runtime-7.0.12-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/e6be672b-53a9-4050-9b55-53f74a55523c/b59ab5af9be85681cf415865a159624f/dotnet-runtime-7.0.12-win-x86.zip', 'dotnet-runtime-7.0.12-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/6d97a102-c4f3-4183-91d7-d810e96e73a1/272349ea2adf0145d9364e2c12bd23a4/dotnet-runtime-7.0.12-win-x64.zip', 'dotnet-runtime-7.0.12-win-x64.zip')"
)
@md 7-0 &@move "*7.0*.*" "7-0\"

@echo+
@echo 6.0.23
@echo https://dotnet.microsoft.com/en-us/download/dotnet/6.0
@if /i "%UsePS%"=="0" (
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/c40fd151-a0f3-42a4-a081-cade6ad66bf8/3e6c8d60725eaa25ef1302a82fb1235b/windowsdesktop-runtime-6.0.23-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/83d32568-c5a2-4117-9591-437051785f41/e75171da01b1fa5c796660dc4b96beed/windowsdesktop-runtime-6.0.23-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/e1f87d42-e036-4a5e-a61d-1df3a5f12c5d/f2f9d74bccf880943dabbccd98fd610f/dotnet-runtime-6.0.23-win-x86.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/0e41930c-8e2d-4fb0-9b50-3a011bbc5338/a5f8b21867caacf4e97bf560eb304f7f/dotnet-runtime-6.0.23-win-x64.exe"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/14ef2fd9-4895-4fd4-b1ac-9a3e01da30eb/05a3833407df2f7749a59946b614c4ec/dotnet-runtime-6.0.23-win-x86.zip"
 @curl.exe -RLO# "https://download.visualstudio.microsoft.com/download/pr/9f10af63-f5e5-437f-931c-dc15fcbe9f4c/2a58f59009b50e5f13a46b3d308c6d63/dotnet-runtime-6.0.23-win-x64.zip"
) else (
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/c40fd151-a0f3-42a4-a081-cade6ad66bf8/3e6c8d60725eaa25ef1302a82fb1235b/windowsdesktop-runtime-6.0.23-win-x86.exe', 'windowsdesktop-runtime-6.0.23-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/83d32568-c5a2-4117-9591-437051785f41/e75171da01b1fa5c796660dc4b96beed/windowsdesktop-runtime-6.0.23-win-x64.exe', 'windowsdesktop-runtime-6.0.23-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/e1f87d42-e036-4a5e-a61d-1df3a5f12c5d/f2f9d74bccf880943dabbccd98fd610f/dotnet-runtime-6.0.23-win-x86.exe', 'dotnet-runtime-6.0.23-win-x86.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/0e41930c-8e2d-4fb0-9b50-3a011bbc5338/a5f8b21867caacf4e97bf560eb304f7f/dotnet-runtime-6.0.23-win-x64.exe', 'dotnet-runtime-6.0.23-win-x64.exe')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/14ef2fd9-4895-4fd4-b1ac-9a3e01da30eb/05a3833407df2f7749a59946b614c4ec/dotnet-runtime-6.0.23-win-x86.zip', 'dotnet-runtime-6.0.23-win-x86.zip')"
 @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/9f10af63-f5e5-437f-931c-dc15fcbe9f4c/2a58f59009b50e5f13a46b3d308c6d63/dotnet-runtime-6.0.23-win-x64.zip', 'dotnet-runtime-6.0.23-win-x64.zip')"
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
@echo 6d0dd5f9dfd53377eaef423c7887f78836099aee7848d74124724c34e5a9928621d2c6784e621ecd5d653f546b52cbbc564d12981b9b42addf6b20d10e7a85c3 *8-0\windowsdesktop-runtime-8.0.0-rc.2-win-x86.exe
@echo 480cd2cd85b10383b1d25ac1e03f060e7c491cf62ac9173ef83f52953e1fb282cdf29f64655d0436eb4a4ffd75333de180e19fa7deb93ea794d70e74296a026e *8-0\windowsdesktop-runtime-8.0.0-rc.2-win-x64.exe
@echo 69602bce7a963c98e99964e7f4da16fe54d84230ea31f744622adf52174ed156ebce3a26abb848ef17e8517563aa18dd37b21fe65cb8f5ddad4c991759e0739d *8-0\dotnet-runtime-8.0.0-rc.2-win-x86.exe
@echo 9c5633a2903f6333b9d9f122da5cb6de78c136d2285a3e71551cd845035b2fc81cd4e97c17a713182c074869c8a04aa3ff8a7a6f026d33a8e0356984d0a132f5 *8-0\dotnet-runtime-8.0.0-rc.2-win-x64.exe
@echo 08a6b580b6e025293f2a5c6452b4e72723043cb42e352d72cb2b77c86d316f82c0b30a779bac009bc412b1ba869012387d6abde4be6f782dcc15790b7c8a89d3 *8-0\dotnet-runtime-8.0.0-rc.2-win-x86.zip
@echo 2ae92847f920a8f039ab189c637a3af28e21e20ee59e95117f3cffb3c77dbada6654e0629168d6d13f60d4cc59a24dd05f233bf460c26892ee2e53a58eb9fc67 *8-0\dotnet-runtime-8.0.0-rc.2-win-x64.zip
@echo ce33129b2c6efe948b1eed73d127e3a5b0bd0af727474c2b8971b9075e37137cd985e58d2e47b9b1f0152a527eac98545e6cdb40054a34a6e3286601069ce259 *7-0\windowsdesktop-runtime-7.0.12-win-x86.exe
@echo a366e858eaca7330358ef5d7a7efada45cc64284e36ba9f7722fa1a1644b1b34b343e700ce718ef67d08c7abf718eff7aefb4d5909ca7b5f63b4056b132c83de *7-0\windowsdesktop-runtime-7.0.12-win-x64.exe
@echo 36f49b417d30a5901ae18fdc7ed540ea88851ef449f34460f580fedcdf0644365989ff0d421584e3a52da6eca394a1327b7c118f4b2b053b875d2064fbd8a1ad *7-0\dotnet-runtime-7.0.12-win-x86.exe
@echo 87b6ac2b1356a48be409c89c11a44093e124a18d8dcca8afa49e7da9dbea416b0024dc0c12fdd44b9047c3dde38979595a301d3102a4f6110132e610f468a4bd *7-0\dotnet-runtime-7.0.12-win-x64.exe
@echo 760f4483b9848c2165be30ad4623de4099529fdcbf61c4e6c1738dfe22e3d776ca7ced89e4d7485dc0337c988b1c3bf1c5757a01e97d156df4ad0cf848226244 *7-0\dotnet-runtime-7.0.12-win-x86.zip
@echo fada96dfe5c0ff99799032b21323b0c75764df8c7991e67c0f2757a0f4d9946c68dee07831a0bda7e884713749150121d618973d14bdcc915d389799b36848bb *7-0\dotnet-runtime-7.0.12-win-x64.zip
@echo 4cc01bb5d2d52bffda533f447aa8bafa73ad5c127d6f440803f0350abacd6119e408e68aea8f155ae715c3427c9ca1ec8acd262f563e2592e86eccb09fd29de3 *6-0\windowsdesktop-runtime-6.0.23-win-x86.exe
@echo 73d07cdcd8a876ba8608490d34e6513c05eac9a70ce0057ff53008f733d3615d57ddf33ea9afc736d4c8d4b19fe38d5cc132c2c472c5f1e38bc7650777b4041a *6-0\windowsdesktop-runtime-6.0.23-win-x64.exe
@echo cdc9127ede2edcaa4fd13e9d6f7681346096a3c21cc59126cf81805b620a3d4986fc9a4e6b7fc430c8568efbe4ce1d3c2fc9cd41abded04ab30a2964f40106f1 *6-0\dotnet-runtime-6.0.23-win-x86.exe
@echo 59ae7105b565a6e71ad5e0dd000e33fe7db4ca8abe0b702ec87cd9fe79d1a41e91140e0d6e99732a8009b656cd287eaa8ccf3b31dcf2920eff609da73cf52413 *6-0\dotnet-runtime-6.0.23-win-x64.exe
@echo 394564e0ea4531f1654df412be2cc4da5a51a49095041f91e53ae2da7389d931772cdfcbabdb1920ca3e3669671ce5144f642e2c6feca936cbb13b61a1ca5c5e *6-0\dotnet-runtime-6.0.23-win-x86.zip
@echo 051794f415fef0356889068cfab9bbb1b2e8cc5c074a5044dfe6a5359e8798b79194c3d961594ada78cc18fade20d30bcb1ce8cf88bddd60494ed43ee7e53a1d *6-0\dotnet-runtime-6.0.23-win-x64.zip
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
