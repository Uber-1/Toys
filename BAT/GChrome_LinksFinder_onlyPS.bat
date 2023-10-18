@echo off
@title All Google Chrome links finder ^| ver.1.0 [12.09.2023]
@cd /d "%~dp0"
@set StageN=1
:NewStage
@if /i "%StageN%"=="1"  (@set OsVers=1&@set CrChan=1)
@if /i "%StageN%"=="2"  (@set OsVers=2&@set CrChan=1)
@if /i "%StageN%"=="3"  (@set OsVers=2&@set CrChan=2)
@if /i "%StageN%"=="4"  (@set OsVers=2&@set CrChan=3)
@if /i "%StageN%"=="5"  (@set OsVers=3&@set CrChan=1)
@if /i "%StageN%"=="6"  (@set OsVers=3&@set CrChan=2)
@if /i "%StageN%"=="7"  (@set OsVers=3&@set CrChan=3)
@if /i "%StageN%"=="8"  (@set OsVers=3&@set CrChan=4)
@if /i "%StageN%"=="9"  (@GOTO AllDone)
@if /i "%OsVers%"=="1"  (@set OsVersNum=6.0)
@if /i "%OsVers%"=="2"  (@set OsVersNum=7.0)
@if /i "%OsVers%"=="3"  (@set OsVersNum=10.0)
@if /i "%CrChan%"=="1"  (@set CrChanAppid=8A69D345-D564-463C-AFF1-A69D9E530F96&@set CrChanName=stable)
@if /i "%CrChan%"=="2"  (@set CrChanAppid=8237E44A-0054-442C-B6B6-EA0509993955&@set CrChanName=beta)
@if /i "%CrChan%"=="3"  (@set CrChanAppid=401C381F-E0DE-4B85-8BD8-3F3F14FBDA57&@set CrChanName=dev)
@if /i "%CrChan%"=="4"  (@set CrChanAppid=4EA16AC7-FD5A-47C3-875B-DBF4A2008C20&@set CrChanName=canary&@set CrChanAP64=x64-canary)
(@echo ^<?xml version="1.0" encoding="UTF-8"?^> ^<request protocol="3.0" ismachine="1" installsource="ondemand" dedup="cr"^> ^<hw physmemory="4" sse="1" sse2="1" sse3="1" ssse3="1" sse41="1" sse42="1" avx="1"/^> ^<os platform="win" version="%OsVersNum%" arch="x86"/^> ^<app appid="{%CrChanAppid%}" release_channel="%CrChanName%" ap=""^>^<updatecheck/^>^</app^> ^</request^> )>"in32.xml"
(@echo ^<?xml version="1.0" encoding="UTF-8"?^> ^<request protocol="3.0" ismachine="1" installsource="ondemand" dedup="cr"^> ^<hw physmemory="4" sse="1" sse2="1" sse3="1" ssse3="1" sse41="1" sse42="1" avx="1"/^> ^<os platform="win" version="%OsVersNum%" arch="x64"/^> ^<app appid="{%CrChanAppid%}" release_channel="%CrChanName%" ap="%CrChanAP64%"^>^<updatecheck/^>^</app^> ^</request^> )>"in64.xml"
@FOR /F "eol=; tokens=1,2* delims= usebackq" %%i in (`@powershell -Command " Invoke-WebRequest -Uri 'https://tools.google.com/service/update2' -Method POST -ContentType 'text/xml' -InFile in32.xml -OutFile out32.xml ; (([xml](gc '.\out32.xml')).response.app.updatecheck|select @{n='DowloadLink';e={$_.urls.url.codebase[-1]+$_.manifest.packages.package.name}}).DowloadLink "`) do (@set Link32=%%i)
@FOR /F "eol=; tokens=1,2* delims= usebackq" %%i in (`@powershell -Command " Invoke-WebRequest -Uri 'https://tools.google.com/service/update2' -Method POST -ContentType 'text/xml' -InFile in64.xml -OutFile out64.xml ; (([xml](gc '.\out64.xml')).response.app.updatecheck|select @{n='DowloadLink';e={$_.urls.url.codebase[-1]+$_.manifest.packages.package.name}}).DowloadLink "`) do (@set Link64=%%i)
(@echo Win32 %CrChanName%: %Link32%)>> chrome_links.txt
(@echo Win64 %CrChanName%: %Link64%)>> chrome_links.txt
(@echo.)>> chrome_links.txt
@del /f /q in32.xml in64.xml out32.xml out64.xml
@set /a StageN=%StageN%+1
@set "Link32= "
@set "Link64= "
@GOTO NewStage
:AllDone
@echo Done.