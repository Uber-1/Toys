@echo off
@title Redistributable downloads: MS VC++, DirectX, NVIDIA PhysX
@echo Latest supported Visual C++ Redistributable downloads
@echo https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170

@set UsePS=0
@if not exist "curl.exe" @if not exist "%SystemRoot%\SYSTEM32\curl.exe" (@set UsePS=1&@color 0C&@echo curl.exe not Found!)
@if /i "%1"=="0" @set UsePS=0
@if /i "%1"=="1" @set UsePS=1

::лллллллллллллллллллллллллллллллл

@echo+
@echo Visual Studio 2005 (VC++ 8.0) SP1
@echo 8.00.50727.6195

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -e"https://www.microsoft.com/en-us/download/details.aspx?id=26347" -o "vcredist.x86-2005.exe"
@curl.exe -RL# "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE" -e"https://www.microsoft.com/en-us/download/details.aspx?id=26347" -o "vcredist.x64-2005.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://www.microsoft.com/en-us/download/details.aspx?id=26347'); $wc.DownloadFile('https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE', 'vcredist.x86-2005.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://www.microsoft.com/en-us/download/details.aspx?id=26347'); $wc.DownloadFile('https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE', 'vcredist.x64-2005.exe')"
)

@set FilePath328=%~dp0vcredist.x86-2005.exe
@set FilePath648=%~dp0vcredist.x64-2005.exe
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath328:\=\\%' get version /value`) do if not "%%b"=="" @set Version328=%%b
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath648:\=\\%' get version /value`) do if not "%%b"=="" @set Version648=%%b
@if /i "%Version328%"=="6.0.2900.2180" (@rename "vcredist.x86-2005.exe" "vcredist.8.00.50727.6195.x86.exe")
@if /i "%Version328%"=="6.0.2900.2180" (@rename "vcredist.x64-2005.exe" "vcredist.8.00.50727.6195.x64.exe")

::лллллллллллллллллллллллллллллллл

@echo+
@echo Visual Studio 2008 (VC++ 9.0) SP1
@echo 9.0.30729.5677

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x86-2008.exe"
@curl.exe -RL# "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x64-2008.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe', 'vcredist.x86-2008.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe', 'vcredist.x64-2008.exe')"
)

@set FilePath329=%~dp0vcredist.x86-2008.exe
@set FilePath649=%~dp0vcredist.x64-2008.exe
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath329:\=\\%' get version /value`) do if not "%%b"=="" @set Version329=%%b
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath649:\=\\%' get version /value`) do if not "%%b"=="" @set Version649=%%b
@rename "vcredist.x86-2008.exe" "vcredist.%Version329%.x86.exe"
@rename "vcredist.x64-2008.exe" "vcredist.%Version649%.x64.exe"

::лллллллллллллллллллллллллллллллл

@echo+
@echo Visual Studio 2010 (VC++ 10.0) SP1
@echo 10.0.40219.325

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x86-2010.exe"
@curl.exe -RL# "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x64-2010.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe', 'vcredist.x86-2010.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe', 'vcredist.x64-2010.exe')"
)

@set FilePath3210=%~dp0vcredist.x86-2010.exe
@set FilePath6410=%~dp0vcredist.x64-2010.exe
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath3210:\=\\%' get version /value`) do if not "%%b"=="" @set Version3210=%%b
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath6410:\=\\%' get version /value`) do if not "%%b"=="" @set Version6410=%%b
@rename "vcredist.x86-2010.exe" "vcredist.%Version3210%.x86.exe"
@rename "vcredist.x64-2010.exe" "vcredist.%Version6410%.x64.exe"

::лллллллллллллллллллллллллллллллл

@echo+
@echo Visual Studio 2012 (VC++ 11.0) Update 4
@echo 11.0.61030.0

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x86-2012.exe"
@curl.exe -RL# "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x64-2012.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe', 'vcredist.x86-2012.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe', 'vcredist.x64-2012.exe')"
)

@set FilePath3211=%~dp0vcredist.x86-2012.exe
@set FilePath6411=%~dp0vcredist.x64-2012.exe
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath3211:\=\\%' get version /value`) do if not "%%b"=="" @set Version3211=%%b
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath6411:\=\\%' get version /value`) do if not "%%b"=="" @set Version6411=%%b
@rename "vcredist.x86-2012.exe" "vcredist.%Version3211%.x86.exe"
@rename "vcredist.x64-2012.exe" "vcredist.%Version6411%.x64.exe"

::лллллллллллллллллллллллллллллллл

@echo+
@echo Visual Studio 2013 (VC++ 12.0)
@echo 12.0.40664.0
:: Direct link 12.0.40664.0 : https://download.visualstudio.microsoft.com/download/pr/10912113/5da66ddebb0ad32ebd4b922fd82e8e25/vcredist_x86.exe
:: Direct link 12.0.40664.0 : https://download.visualstudio.microsoft.com/download/pr/10912041/cee5d6bca2ddbcd039da727bf4acb48a/vcredist_x64.exe

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://aka.ms/highdpimfc2013x86enu" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x86-2013.exe"
@curl.exe -RL# "https://aka.ms/highdpimfc2013x64enu" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x64-2013.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://aka.ms/highdpimfc2013x86enu', 'vcredist.x86-2013.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://aka.ms/highdpimfc2013x64enu', 'vcredist.x64-2013.exe')"
)

@set FilePath3212=%~dp0vcredist.x86-2013.exe
@set FilePath6412=%~dp0vcredist.x64-2013.exe
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath3212:\=\\%' get version /value`) do if not "%%b"=="" @set Version3212=%%b
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath6412:\=\\%' get version /value`) do if not "%%b"=="" @set Version6412=%%b
@rename "vcredist.x86-2013.exe" "vcredist.%Version3212%.x86.exe"
@rename "vcredist.x64-2013.exe" "vcredist.%Version6412%.x64.exe"

:: @if /i "%UsePS%"=="0" (
:: @curl.exe -RL# "https://download.visualstudio.microsoft.com/download/pr/10912041/cee5d6bca2ddbcd039da727bf4acb48a/vcredist_x64.exe" -o "vcredist.12.0.40664.0.x64.exe"
:: @curl.exe -RL# "https://download.visualstudio.microsoft.com/download/pr/10912113/5da66ddebb0ad32ebd4b922fd82e8e25/vcredist_x86.exe" -o "vcredist.12.0.40664.0.x86.exe"
:: ) else (
:: @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/10912041/cee5d6bca2ddbcd039da727bf4acb48a/vcredist_x64.exe', 'vcredist.12.0.40664.0.x64.exe')"
:: @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/10912113/5da66ddebb0ad32ebd4b922fd82e8e25/vcredist_x86.exe', 'vcredist.12.0.40664.0.x86.exe')"
:: )

::лллллллллллллллллллллллллллллллл

@echo+
@echo Visual Studio 2015, 2017, 2019, 2022

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://aka.ms/vs/15/release/vc_redist.x86.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x86-2015-2017.exe"
@curl.exe -RL# "https://aka.ms/vs/15/release/vc_redist.x64.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x64-2015-2017.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://aka.ms/vs/15/release/vc_redist.x86.exe', 'vcredist.x86-2015-2017.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://aka.ms/vs/15/release/vc_redist.x64.exe', 'vcredist.x64-2015-2017.exe')"
)

::  14.28.29213.0 -- last for Windows XP
@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://download.visualstudio.microsoft.com/download/pr/566435ac-4e1c-434b-b93f-aecc71e8cffc/0D59EC7FDBF05DE813736BF875CEA5C894FFF4769F60E32E87BD48406BBF0A3A/VC_redist.x86.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x86-2015-2017-2019-XP.exe"
@curl.exe -RL# "https://download.visualstudio.microsoft.com/download/pr/566435ac-4e1c-434b-b93f-aecc71e8cffc/B75590149FA14B37997C35724BC93776F67E08BFF9BD5A69FACBF41B3846D084/VC_redist.x64.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x64-2015-2017-2019-XP.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/566435ac-4e1c-434b-b93f-aecc71e8cffc/0D59EC7FDBF05DE813736BF875CEA5C894FFF4769F60E32E87BD48406BBF0A3A/VC_redist.x86.exe', 'vcredist.x86-2015-2017-2019-XP.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://download.visualstudio.microsoft.com/download/pr/566435ac-4e1c-434b-b93f-aecc71e8cffc/B75590149FA14B37997C35724BC93776F67E08BFF9BD5A69FACBF41B3846D084/VC_redist.x64.exe', 'vcredist.x64-2015-2017-2019-XP.exe')"
)

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://aka.ms/vs/16/release/vc_redist.x86.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x86-2015-2017-2019.exe"
@curl.exe -RL# "https://aka.ms/vs/16/release/vc_redist.x64.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x64-2015-2017-2019.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://aka.ms/vs/16/release/vc_redist.x86.exe', 'vcredist.x86-2015-2017-2019.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://aka.ms/vs/16/release/vc_redist.x64.exe', 'vcredist.x64-2015-2017-2019.exe')"
)

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://aka.ms/vs/17/release/vc_redist.x86.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x86-2015-2017-2019-2022.exe"
@curl.exe -RL# "https://aka.ms/vs/17/release/vc_redist.x64.exe" -e"https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170" -o "vcredist.x64-2015-2017-2019-2022.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://aka.ms/vs/17/release/vc_redist.x86.exe', 'vcredist.x86-2015-2017-2019-2022.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170'); $wc.DownloadFile('https://aka.ms/vs/17/release/vc_redist.x64.exe', 'vcredist.x64-2015-2017-2019-2022.exe')"
)

@set FilePath3214_15=%~dp0vcredist.x86-2015-2017.exe
@set FilePath6414_15=%~dp0vcredist.x64-2015-2017.exe
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath3214_15:\=\\%' get version /value`) do if not "%%b"=="" @set Version3214_15=%%b
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath6414_15:\=\\%' get version /value`) do if not "%%b"=="" @set Version6414_15=%%b
@rename "vcredist.x86-2015-2017.exe" "vcredist.%Version3214_15%.x86.exe"
@rename "vcredist.x64-2015-2017.exe" "vcredist.%Version6414_15%.x64.exe"

@set FilePath3214_16=%~dp0vcredist.x86-2015-2017-2019-XP.exe
@set FilePath6414_16=%~dp0vcredist.x64-2015-2017-2019-XP.exe
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath3214_16:\=\\%' get version /value`) do if not "%%b"=="" @set Version3214_16-XP=%%b
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath6414_16:\=\\%' get version /value`) do if not "%%b"=="" @set Version6414_16-XP=%%b
@rename "vcredist.x86-2015-2017-2019-XP.exe" "vcredist.%Version3214_16-XP%-XP.x86.exe"
@rename "vcredist.x64-2015-2017-2019-XP.exe" "vcredist.%Version6414_16-XP%-XP.x64.exe"

@set FilePath3214_16=%~dp0vcredist.x86-2015-2017-2019.exe
@set FilePath6414_16=%~dp0vcredist.x64-2015-2017-2019.exe
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath3214_16:\=\\%' get version /value`) do if not "%%b"=="" @set Version3214_16=%%b
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath6414_16:\=\\%' get version /value`) do if not "%%b"=="" @set Version6414_16=%%b
@rename "vcredist.x86-2015-2017-2019.exe" "vcredist.%Version3214_16%.x86.exe"
@rename "vcredist.x64-2015-2017-2019.exe" "vcredist.%Version6414_16%.x64.exe"

@set FilePath3214_17=%~dp0vcredist.x86-2015-2017-2019-2022.exe
@set FilePath6414_17=%~dp0vcredist.x64-2015-2017-2019-2022.exe
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath3214_17:\=\\%' get version /value`) do if not "%%b"=="" @set Version3214_17=%%b
@for /f "tokens=1* delims== usebackq" %%a in (`wmic datafile where name^='%FilePath6414_17:\=\\%' get version /value`) do if not "%%b"=="" @set Version6414_17=%%b
@rename "vcredist.x86-2015-2017-2019-2022.exe" "vcredist.%Version3214_17%.x86.exe"
@rename "vcredist.x64-2015-2017-2019-2022.exe" "vcredist.%Version6414_17%.x64.exe"

::лллллллллллллллллллллллллллллллл

(
@echo f4d74643a0e117ea80b2c7ebcd908a6dd26aa9ea *vcredist.8.00.50727.6195.x64.exe
@echo 56ae8221e8024c8deed430e01a6160795c64cf53 *vcredist.8.00.50727.6195.x86.exe
@echo ce8ff6572e86b0bba39d88fa3a6d56b59100613d *vcredist.9.0.30729.5677.x64.exe
@echo 0940ec60dcc3162e482c1a797ca033d5996ab256 *vcredist.9.0.30729.5677.x86.exe
@echo 8691972f0a5bf919701ac3b80fb693fc715420c2 *vcredist.10.0.40219.325.x64.exe
@echo 2222fc008e469fec77d0d291877f357c6e1eb16d *vcredist.10.0.40219.325.x86.exe
@echo 1a5d93dddbc431ab27b1da711cd3370891542797 *vcredist.11.0.61030.0.x64.exe
@echo 96b377a27ac5445328cbaae210fc4f0aaa750d3f *vcredist.11.0.61030.0.x86.exe
@echo 1194e6bf4153fa88f20b2a70ac15bc359ada4ee2 *vcredist.12.0.40664.0.x64.exe
@echo 0f5d66bcaf120f2d3f340e448a268fe4bbf7709d *vcredist.12.0.40664.0.x86.exe
@echo 747540e8001fa6f5b3a44af2a87d5c30b4183016 *vcredist.14.16.27052.0.x64.exe
@echo d6e1f8c8fff153a59a11fab9777ddab60d9d023c *vcredist.14.16.27052.0.x86.exe
@echo 8dd01942cd3400f8fb303c08391e4c94cc1bc313 *vcredist.14.28.29213.0-XP.x64.exe
@echo b2b6f1aa711becef44f8ddf44710f5b842d29574 *vcredist.14.28.29213.0-XP.x86.exe
@echo 91a09963703189274e995ded25b94e165545f126 *vcredist.14.29.30156.0.x64.exe
@echo 2432668dc47827fb9a7ca9f4d3800280cde6f46b *vcredist.14.29.30156.0.x86.exe
@echo c14a4b9a374d3ebd3f032a51b356dc8054d98e5a *vcredist.14.44.35208.0.x64.exe
@echo fb3a9b4b4fbce99628f6fab2e320d3ad2f570a73 *vcredist.14.44.35208.0.x86.exe
)>vcredist.sha

::лллллллллллллллллллллллллллллллл

@echo+
@echo DX Web Setup
@echo DirectX Jun2010 redist

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe" -e"https://www.microsoft.com/en-us/Download/confirmation.aspx?id=35" -o "dxwebsetup.exe"
@curl.exe -RL# "https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe" -e"https://www.microsoft.com/en-us/download/confirmation.aspx?id=8109" -o "directx_Jun2010_redist.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://www.microsoft.com/en-us/Download/confirmation.aspx?id=35'); $wc.DownloadFile('https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe', 'dxwebsetup.exe')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://www.microsoft.com/en-us/download/confirmation.aspx?id=8109'); $wc.DownloadFile('https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe', 'directx_Jun2010_redist.exe')"
)

::лллллллллллллллллллллллллллллллл

@echo+
@echo DirectX 11.1 for Windows 7 SP1 and Windows Server 2008 R2 SP1
@echo https://support.microsoft.com/en-us/kb/179113
@echo https://support.microsoft.com/en-us/topic/how-to-install-the-latest-version-of-directx-d1f5ffa5-dae2-246c-91b1-ee1e973ed8c2

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://download.microsoft.com/download/1/4/9/14936FE9-4D16-4019-A093-5E00182609EB/Windows6.1-KB2670838-x86.msu" -e"https://www.microsoft.com/en-us/download/details.aspx?id=36805" -o "Windows6.1-KB2670838-x86.msu"
@curl.exe -RL# "https://download.microsoft.com/download/1/4/9/14936FE9-4D16-4019-A093-5E00182609EB/Windows6.1-KB2670838-x64.msu" -e"https://www.microsoft.com/en-us/download/details.aspx?id=36805" -o "Windows6.1-KB2670838-x64.msu"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://www.microsoft.com/en-us/download/details.aspx?id=36805'); $wc.DownloadFile('https://download.microsoft.com/download/1/4/9/14936FE9-4D16-4019-A093-5E00182609EB/Windows6.1-KB2670838-x86.msu', 'Windows6.1-KB2670838-x86.msu')"
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://www.microsoft.com/en-us/download/details.aspx?id=36805'); $wc.DownloadFile('https://download.microsoft.com/download/1/4/9/14936FE9-4D16-4019-A093-5E00182609EB/Windows6.1-KB2670838-x64.msu', 'Windows6.1-KB2670838-x64.msu')"
)

::лллллллллллллллллллллллллллллллл

(
@echo 7bf35f2afca666078db35ca95130beb2e3782212 *dxwebsetup.exe
@echo 7e5d2e5e1a13fbc47f990cc55cbdb428cd12f759 *directx_Jun2010_redist.exe
@echo 9f667ff60e80b64cbed2774681302baeaf0fc6a6 *Windows6.1-KB2670838-x64.msu
@echo 984b8d122a688d917f81c04155225b3ef31f012e *Windows6.1-KB2670838-x86.msu
)>directx.sha

::лллллллллллллллллллллллллллллллл

@echo+
@echo NVIDIA PhysX System Software
@echo https://www.nvidia.com/en-us/drivers/physx/physx-9-19-0218-driver/

@if /i "%UsePS%"=="0" (
@curl.exe -RL# "https://us.download.nvidia.com/Windows/9.19.0218/PhysX-9.19.0218-SystemSoftware.exe" -e"https://www.nvidia.com/content/DriverDownload-March2009/confirmation.php?url=/Windows/9.19.0218/PhysX-9.19.0218-SystemSoftware.exe&lang=us&type=GeForce" -o "PhysX-9.19.0218-SystemSoftware.exe"
) else (
@powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://www.nvidia.com/content/DriverDownload-March2009/confirmation.php?url=/Windows/9.19.0218/PhysX-9.19.0218-SystemSoftware.exe&lang=us&type=GeForce'); $wc.DownloadFile('https://us.download.nvidia.com/Windows/9.19.0218/PhysX-9.19.0218-SystemSoftware.exe', 'PhysX-9.19.0218-SystemSoftware.exe')"
)

@echo+
(
@echo 3b56abd0bc89090b6d6ceeaf2b5d27577b7b76b6 *PhysX-9.19.0218-SystemSoftware.exe
)>physx.sha

::лллллллллллллллллллллллллллллллл

:: @if /i "%1"=="nocab" @goto NoCab
:: (@dir *.bat *.exe *.sha *.msu /b)>"filelist.txt"
:: @makecab /d Compress=off /d "CabinetName1=Redist.cab" /D MaxDiskSize=1073741824 /f "filelist.txt"
:: :: @makecab /d CompressionMemory=21 /d CompressionType=LZX /d "CabinetName1=Redist.cab" /D MaxDiskSize=1073741824 /f "filelist.txt"
:: @del /q /f setup.inf setup.rpt "filelist.txt"
:: @move disk1\Redist.cab Redist.cab
:: @rd /q disk1
:: @pause
:: :NoCab

@echo+
@echo Done!
@pause > nul
