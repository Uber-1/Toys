@echo off
@set dotNETver8=8.0.1
@set dotNETver7=7.0.15
@set dotNETver6=6.0.26
@set dotNETver5=5.0.17
@echo.
@for /f "eol=- tokens=1-26 delims=()/" %%a in ('@curl.exe -lsL "https://raw.githubusercontent.com/dotnet/core/main/release-notes/8.0/README.md"  ^| 2^>nul FINDSTR /IRC:"release-notes/8.0"') do (@if not defined CheckVerNET8 (@set CheckVerNET8=%%l))
@for /f "eol=- tokens=1-26 delims=()/" %%a in ('@curl.exe -lsL "https://raw.githubusercontent.com/dotnet/core/main/release-notes/7.0/README.md"  ^| 2^>nul FINDSTR /IRC:"release-notes/7.0"') do (@if not defined CheckVerNET7 (@set CheckVerNET7=%%l))
@for /f "eol=- tokens=1-26 delims=()/" %%a in ('@curl.exe -lsL "https://raw.githubusercontent.com/dotnet/core/main/release-notes/6.0/README.md"  ^| 2^>nul FINDSTR /IRC:"release-notes/6.0"') do (@if not defined CheckVerNET6 (@set CheckVerNET6=%%l))
@for /f "eol=- tokens=1-26 delims=()/" %%a in ('@curl.exe -lsL "https://raw.githubusercontent.com/dotnet/core/main/release-notes/5.0/README.md"  ^| 2^>nul FINDSTR /IRC:"release-notes/5.0"') do (@if not defined CheckVerNET5 (@set CheckVerNET5=%%l))
@set /p selver=Use versinos [%CheckVerNET5:.md=%, %CheckVerNET6:.md=%, %CheckVerNET7:.md=%, %CheckVerNET8:.md=%]:ÿ[Y/N]ÿ
@if /i "%selver%"=="Y" ((@set dotNETver5=%CheckVerNET5:.md=%)&(@set dotNETver6=%CheckVerNET6:.md=%)&(@set dotNETver7=%CheckVerNET7:.md=%)&(@set dotNETver8=%CheckVerNET8:.md=%)&@echo Using new versions.)

@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver8%-windows-x86-installer" ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET8d32 (@set CheckVerNET8d32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver8%-windows-x64-installer" ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET8d64 (@set CheckVerNET8d64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver8%-windows-x86-installer"         ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET8i32 (@set CheckVerNET8i32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver8%-windows-x64-installer"         ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET8i64 (@set CheckVerNET8i64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver8%-windows-x86-binaries"          ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET8b32 (@set CheckVerNET8b32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver8%-windows-x64-binaries"          ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET8b64 (@set CheckVerNET8b64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver8%-windows-x86-installer" ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET8d32s (@set CheckVerNET8d32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver8%-windows-x64-installer" ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET8d64s (@set CheckVerNET8d64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver8%-windows-x86-installer"         ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET8i32s (@set CheckVerNET8i32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver8%-windows-x64-installer"         ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET8i64s (@set CheckVerNET8i64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver8%-windows-x86-binaries"          ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET8b32s (@set CheckVerNET8b32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver8%-windows-x64-binaries"          ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET8b64s (@set CheckVerNET8b64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver7%-windows-x86-installer" ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET7d32 (@set CheckVerNET7d32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver7%-windows-x64-installer" ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET7d64 (@set CheckVerNET7d64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver7%-windows-x86-installer"         ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET7i32 (@set CheckVerNET7i32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver7%-windows-x64-installer"         ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET7i64 (@set CheckVerNET7i64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver7%-windows-x86-binaries"          ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET7b32 (@set CheckVerNET7b32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver7%-windows-x64-binaries"          ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET7b64 (@set CheckVerNET7b64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver7%-windows-x86-installer" ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET7d32s (@set CheckVerNET7d32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver7%-windows-x64-installer" ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET7d64s (@set CheckVerNET7d64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver7%-windows-x86-installer"         ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET7i32s (@set CheckVerNET7i32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver7%-windows-x64-installer"         ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET7i64s (@set CheckVerNET7i64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver7%-windows-x86-binaries"          ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET7b32s (@set CheckVerNET7b32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver7%-windows-x64-binaries"          ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET7b64s (@set CheckVerNET7b64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver6%-windows-x86-installer" ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET6d32 (@set CheckVerNET6d32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver6%-windows-x64-installer" ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET6d64 (@set CheckVerNET6d64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver6%-windows-x86-installer"         ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET6i32 (@set CheckVerNET6i32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver6%-windows-x64-installer"         ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET6i64 (@set CheckVerNET6i64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver6%-windows-x86-binaries"          ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET6b32 (@set CheckVerNET6b32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver6%-windows-x64-binaries"          ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET6b64 (@set CheckVerNET6b64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver6%-windows-x86-installer" ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET6d32s (@set CheckVerNET6d32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver6%-windows-x64-installer" ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET6d64s (@set CheckVerNET6d64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver6%-windows-x86-installer"         ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET6i32s (@set CheckVerNET6i32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver6%-windows-x64-installer"         ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET6i64s (@set CheckVerNET6i64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver6%-windows-x86-binaries"          ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET6b32s (@set CheckVerNET6b32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver6%-windows-x64-binaries"          ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET6b64s (@set CheckVerNET6b64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver5%-windows-x86-installer" ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET5d32 (@set CheckVerNET5d32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver5%-windows-x64-installer" ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET5d64 (@set CheckVerNET5d64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver5%-windows-x86-installer"         ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET5i32 (@set CheckVerNET5i32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver5%-windows-x64-installer"         ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET5i64 (@set CheckVerNET5i64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver5%-windows-x86-binaries"          ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET5b32 (@set CheckVerNET5b32=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver5%-windows-x64-binaries"          ^| 2^>nul FINDSTR /IRC:"id..directLink.*.http"') do (@if not defined CheckVerNET5b64 (@set CheckVerNET5b64=%%f))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver5%-windows-x86-installer" ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET5d32s (@set CheckVerNET5d32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-%dotNETver5%-windows-x64-installer" ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET5d64s (@set CheckVerNET5d64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver5%-windows-x86-installer"         ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET5i32s (@set CheckVerNET5i32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver5%-windows-x64-installer"         ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET5i64s (@set CheckVerNET5i64s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver5%-windows-x86-binaries"          ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET5b32s (@set CheckVerNET5b32s=%%j))
@for /f eol^=-^ tokens^=1-26^ delims^=^" %%a in ('@curl.exe -lsL "https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-%dotNETver5%-windows-x64-binaries"          ^| 2^>nul FINDSTR /IRC:"id..checksum.*checksum-label"') do (@if not defined CheckVerNET5b64s (@set CheckVerNET5b64s=%%j))
@md dotNET5678
@cd dotNET5678

(@echo @echo+)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %dotNETver8%)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo https://dotnet.microsoft.com/en-us/download/dotnet/8.0)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @if /i "%%UsePS%%"=="0" ^()>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET8d32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET8d64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET8i32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET8i64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET8b32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET8b64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo %CheckVerNET8d32s% *windowsdesktop-runtime-%dotNETver8%-win-x86.exe)>> %dotNETver8%.sha256
(@echo %CheckVerNET8d64s% *windowsdesktop-runtime-%dotNETver8%-win-x64.exe)>> %dotNETver8%.sha256
(@echo %CheckVerNET8i32s% *dotnet-runtime-%dotNETver8%-win-x86.exe)>> %dotNETver8%.sha256
(@echo %CheckVerNET8i64s% *dotnet-runtime-%dotNETver8%-win-x64.exe)>> %dotNETver8%.sha256
(@echo %CheckVerNET8b32s% *dotnet-runtime-%dotNETver8%-win-x86.zip)>> %dotNETver8%.sha256
(@echo %CheckVerNET8b64s% *dotnet-runtime-%dotNETver8%-win-x64.zip)>> %dotNETver8%.sha256
(@echo ^) else ^()>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('%CheckVerNET8d32%', 'windowsdesktop-runtime-%dotNETver8%-win-x86.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('%CheckVerNET8d64%', 'windowsdesktop-runtime-%dotNETver8%-win-x64.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('%CheckVerNET8i32%', 'dotnet-runtime-%dotNETver8%-win-x86.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('%CheckVerNET8i64%', 'dotnet-runtime-%dotNETver8%-win-x64.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('%CheckVerNET8b32%', 'dotnet-runtime-%dotNETver8%-win-x86.zip')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/8.0'); $wc.DownloadFile('%CheckVerNET8b64%', 'dotnet-runtime-%dotNETver8%-win-x64.zip')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo ^))>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @md 8-0 ^&@move "*8.0*.*" "8-0\")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo.)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo+)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %dotNETver7%)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo https://dotnet.microsoft.com/en-us/download/dotnet/7.0)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @if /i "%%UsePS%%"=="0" ^()>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET7d32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET7d64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET7i32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET7i64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET7b32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET7b64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo %CheckVerNET7d32s% *windowsdesktop-runtime-%dotNETver7%-win-x86.exe)>> %dotNETver7%.sha256
(@echo %CheckVerNET7d64s% *windowsdesktop-runtime-%dotNETver7%-win-x64.exe)>> %dotNETver7%.sha256
(@echo %CheckVerNET7i32s% *dotnet-runtime-%dotNETver7%-win-x86.exe)>> %dotNETver7%.sha256
(@echo %CheckVerNET7i64s% *dotnet-runtime-%dotNETver7%-win-x64.exe)>> %dotNETver7%.sha256
(@echo %CheckVerNET7b32s% *dotnet-runtime-%dotNETver7%-win-x86.zip)>> %dotNETver7%.sha256
(@echo %CheckVerNET7b64s% *dotnet-runtime-%dotNETver7%-win-x64.zip)>> %dotNETver7%.sha256
(@echo ^) else ^()>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('%CheckVerNET7d32%', 'windowsdesktop-runtime-%dotNETver7%-win-x86.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('%CheckVerNET7d64%', 'windowsdesktop-runtime-%dotNETver7%-win-x64.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('%CheckVerNET7i32%', 'dotnet-runtime-%dotNETver7%-win-x86.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('%CheckVerNET7i64%', 'dotnet-runtime-%dotNETver7%-win-x64.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('%CheckVerNET7b32%', 'dotnet-runtime-%dotNETver7%-win-x86.zip')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/7.0'); $wc.DownloadFile('%CheckVerNET7b64%', 'dotnet-runtime-%dotNETver7%-win-x64.zip')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo ^))>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @md 7-0 ^&@move "*7.0*.*" "7-0\")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo.)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo+)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %dotNETver6%)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo https://dotnet.microsoft.com/en-us/download/dotnet/6.0)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @if /i "%%UsePS%%"=="0" ^()>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET6d32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET6d64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET6i32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET6i64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET6b32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET6b64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo %CheckVerNET6d32s% *windowsdesktop-runtime-%dotNETver6%-win-x86.exe)>> %dotNETver6%.sha256
(@echo %CheckVerNET6d64s% *windowsdesktop-runtime-%dotNETver6%-win-x64.exe)>> %dotNETver6%.sha256
(@echo %CheckVerNET6i32s% *dotnet-runtime-%dotNETver6%-win-x86.exe)>> %dotNETver6%.sha256
(@echo %CheckVerNET6i64s% *dotnet-runtime-%dotNETver6%-win-x64.exe)>> %dotNETver6%.sha256
(@echo %CheckVerNET6b32s% *dotnet-runtime-%dotNETver6%-win-x86.zip)>> %dotNETver6%.sha256
(@echo %CheckVerNET6b64s% *dotnet-runtime-%dotNETver6%-win-x64.zip)>> %dotNETver6%.sha256
(@echo ^) else ^()>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('%CheckVerNET6d32%', 'windowsdesktop-runtime-%dotNETver6%-win-x86.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('%CheckVerNET6d64%', 'windowsdesktop-runtime-%dotNETver6%-win-x64.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('%CheckVerNET6i32%', 'dotnet-runtime-%dotNETver6%-win-x86.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('%CheckVerNET6i64%', 'dotnet-runtime-%dotNETver6%-win-x64.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('%CheckVerNET6b32%', 'dotnet-runtime-%dotNETver6%-win-x86.zip')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/6.0'); $wc.DownloadFile('%CheckVerNET6b64%', 'dotnet-runtime-%dotNETver6%-win-x64.zip')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo ^))>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @md 6-0 ^&@move "*6.0*.*" "6-0\")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo.)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo+)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %dotNETver5%)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo https://dotnet.microsoft.com/en-us/download/dotnet/5.0)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @if /i "%%UsePS%%"=="0" ^()>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET5d32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET5d64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET5i32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET5i64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET5b32%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @curl.exe -RLO# "%CheckVerNET5b64%")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo %CheckVerNET5d32s% *windowsdesktop-runtime-%dotNETver5%-win-x86.exe)>> %dotNETver5%.sha256
(@echo %CheckVerNET5d64s% *windowsdesktop-runtime-%dotNETver5%-win-x64.exe)>> %dotNETver5%.sha256
(@echo %CheckVerNET5i32s% *dotnet-runtime-%dotNETver5%-win-x86.exe)>> %dotNETver5%.sha256
(@echo %CheckVerNET5i64s% *dotnet-runtime-%dotNETver5%-win-x64.exe)>> %dotNETver5%.sha256
(@echo %CheckVerNET5b32s% *dotnet-runtime-%dotNETver5%-win-x86.zip)>> %dotNETver5%.sha256
(@echo %CheckVerNET5b64s% *dotnet-runtime-%dotNETver5%-win-x64.zip)>> %dotNETver5%.sha256
(@echo ^) else ^()>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('%CheckVerNET5d32%', 'windowsdesktop-runtime-%dotNETver5%-win-x86.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('%CheckVerNET5d64%', 'windowsdesktop-runtime-%dotNETver5%-win-x64.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('%CheckVerNET5i32%', 'dotnet-runtime-%dotNETver5%-win-x86.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('%CheckVerNET5i64%', 'dotnet-runtime-%dotNETver5%-win-x64.exe')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('%CheckVerNET5b32%', 'dotnet-runtime-%dotNETver5%-win-x86.zip')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo  @powershell -Command "$wc = New-Object System.Net.WebClient; $wc.Headers.Add('referer','https://dotnet.microsoft.com/en-us/download/dotnet/5.0'); $wc.DownloadFile('%CheckVerNET5b64%', 'dotnet-runtime-%dotNETver5%-win-x64.zip')")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo ^))>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @md 5-0 ^&@move "*5.0*.*" "5-0\")>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo.)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo ^()>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET8d32s% *8-0\windowsdesktop-runtime-%dotNETver8%-win-x86.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET8d64s% *8-0\windowsdesktop-runtime-%dotNETver8%-win-x64.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET8i32s% *8-0\dotnet-runtime-%dotNETver8%-win-x86.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET8i64s% *8-0\dotnet-runtime-%dotNETver8%-win-x64.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET8b32s% *8-0\dotnet-runtime-%dotNETver8%-win-x86.zip)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET8b64s% *8-0\dotnet-runtime-%dotNETver8%-win-x64.zip)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET7d32s% *7-0\windowsdesktop-runtime-%dotNETver7%-win-x86.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET7d64s% *7-0\windowsdesktop-runtime-%dotNETver7%-win-x64.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET7i32s% *7-0\dotnet-runtime-%dotNETver7%-win-x86.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET7i64s% *7-0\dotnet-runtime-%dotNETver7%-win-x64.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET7b32s% *7-0\dotnet-runtime-%dotNETver7%-win-x86.zip)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET7b64s% *7-0\dotnet-runtime-%dotNETver7%-win-x64.zip)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET6d32s% *6-0\windowsdesktop-runtime-%dotNETver6%-win-x86.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET6d64s% *6-0\windowsdesktop-runtime-%dotNETver6%-win-x64.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET6i32s% *6-0\dotnet-runtime-%dotNETver6%-win-x86.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET6i64s% *6-0\dotnet-runtime-%dotNETver6%-win-x64.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET6b32s% *6-0\dotnet-runtime-%dotNETver6%-win-x86.zip)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET6b64s% *6-0\dotnet-runtime-%dotNETver6%-win-x64.zip)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET5d32s% *5-0\windowsdesktop-runtime-%dotNETver5%-win-x86.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET5d64s% *5-0\windowsdesktop-runtime-%dotNETver5%-win-x64.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET5i32s% *5-0\dotnet-runtime-%dotNETver5%-win-x86.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET5i64s% *5-0\dotnet-runtime-%dotNETver5%-win-x64.exe)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET5b32s% *5-0\dotnet-runtime-%dotNETver5%-win-x86.zip)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo @echo %CheckVerNET5b64s% *5-0\dotnet-runtime-%dotNETver5%-win-x64.zip)>> CURL_DL_dotNET5678_ForUniDl.bat
(@echo ^)^>sha.sha)>> CURL_DL_dotNET5678_ForUniDl.bat

(@echo :dotNETReleaseOnly8)>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET8d32%" -o "%%TmDlWDir%%\8-0\windowsdesktop-runtime-%dotNETver8%-win-x86.exe"  ^&^(@echo %CheckVerNET8d32s% *8-0\windowsdesktop-runtime-%dotNETver8%-win-x86.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET8d64%" -o "%%TmDlWDir%%\8-0\windowsdesktop-runtime-%dotNETver8%-win-x64.exe"  ^&^(@echo %CheckVerNET8d64s% *8-0\windowsdesktop-runtime-%dotNETver8%-win-x64.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET8i32%"         -o "%%TmDlWDir%%\8-0\dotnet-runtime-%dotNETver8%-win-x86.exe"          ^&^(@echo %CheckVerNET8i32s% *8-0\dotnet-runtime-%dotNETver8%-win-x86.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET8i64%"         -o "%%TmDlWDir%%\8-0\dotnet-runtime-%dotNETver8%-win-x64.exe"          ^&^(@echo %CheckVerNET8i64s% *8-0\dotnet-runtime-%dotNETver8%-win-x64.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET8b32%"         -o "%%TmDlWDir%%\8-0\dotnet-runtime-%dotNETver8%-win-x86.zip"          ^&^(@echo %CheckVerNET8b32s% *8-0\dotnet-runtime-%dotNETver8%-win-x86.zip^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET8b64%"         -o "%%TmDlWDir%%\8-0\dotnet-runtime-%dotNETver8%-win-x64.zip"          ^&^(@echo %CheckVerNET8b64s% *8-0\dotnet-runtime-%dotNETver8%-win-x64.zip^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :dotNETReleaseOnly7)>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET7d32%" -o "%%TmDlWDir%%\7-0\windowsdesktop-runtime-%dotNETver7%-win-x86.exe"  ^&^(@echo %CheckVerNET7d32s% *7-0\windowsdesktop-runtime-%dotNETver7%-win-x86.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET7d64%" -o "%%TmDlWDir%%\7-0\windowsdesktop-runtime-%dotNETver7%-win-x64.exe"  ^&^(@echo %CheckVerNET7d64s% *7-0\windowsdesktop-runtime-%dotNETver7%-win-x64.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET7i32%"         -o "%%TmDlWDir%%\7-0\dotnet-runtime-%dotNETver7%-win-x86.exe"          ^&^(@echo %CheckVerNET7i32s% *7-0\dotnet-runtime-%dotNETver7%-win-x86.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET7i64%"         -o "%%TmDlWDir%%\7-0\dotnet-runtime-%dotNETver7%-win-x64.exe"          ^&^(@echo %CheckVerNET7i64s% *7-0\dotnet-runtime-%dotNETver7%-win-x64.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET7b32%"         -o "%%TmDlWDir%%\7-0\dotnet-runtime-%dotNETver7%-win-x86.zip"          ^&^(@echo %CheckVerNET7b32s% *7-0\dotnet-runtime-%dotNETver7%-win-x86.zip^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET7b64%"         -o "%%TmDlWDir%%\7-0\dotnet-runtime-%dotNETver7%-win-x64.zip"          ^&^(@echo %CheckVerNET7b64s% *7-0\dotnet-runtime-%dotNETver7%-win-x64.zip^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :dotNETReleaseOnly6)>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET6d32%" -o "%%TmDlWDir%%\6-0\windowsdesktop-runtime-%dotNETver6%-win-x86.exe"  ^&^(@echo %CheckVerNET6d32s% *6-0\windowsdesktop-runtime-%dotNETver6%-win-x86.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET6d64%" -o "%%TmDlWDir%%\6-0\windowsdesktop-runtime-%dotNETver6%-win-x64.exe"  ^&^(@echo %CheckVerNET6d64s% *6-0\windowsdesktop-runtime-%dotNETver6%-win-x64.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET6i32%"         -o "%%TmDlWDir%%\6-0\dotnet-runtime-%dotNETver6%-win-x86.exe"          ^&^(@echo %CheckVerNET6i32s% *6-0\dotnet-runtime-%dotNETver6%-win-x86.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET6i64%"         -o "%%TmDlWDir%%\6-0\dotnet-runtime-%dotNETver6%-win-x64.exe"          ^&^(@echo %CheckVerNET6i64s% *6-0\dotnet-runtime-%dotNETver6%-win-x64.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET6b32%"         -o "%%TmDlWDir%%\6-0\dotnet-runtime-%dotNETver6%-win-x86.zip"          ^&^(@echo %CheckVerNET6b32s% *6-0\dotnet-runtime-%dotNETver6%-win-x86.zip^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET6b64%"         -o "%%TmDlWDir%%\6-0\dotnet-runtime-%dotNETver6%-win-x64.zip"          ^&^(@echo %CheckVerNET6b64s% *6-0\dotnet-runtime-%dotNETver6%-win-x64.zip^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :dotNETReleaseOnly5)>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET5d32%" -o "%%TmDlWDir%%\5-0\windowsdesktop-runtime-%dotNETver5%-win-x86.exe"  ^&^(@echo %CheckVerNET5d32s% *5-0\windowsdesktop-runtime-%dotNETver5%-win-x86.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET5d64%" -o "%%TmDlWDir%%\5-0\windowsdesktop-runtime-%dotNETver5%-win-x64.exe"  ^&^(@echo %CheckVerNET5d64s% *5-0\windowsdesktop-runtime-%dotNETver5%-win-x64.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET5i32%"         -o "%%TmDlWDir%%\5-0\dotnet-runtime-%dotNETver5%-win-x86.exe"          ^&^(@echo %CheckVerNET5i32s% *5-0\dotnet-runtime-%dotNETver5%-win-x86.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET5i64%"         -o "%%TmDlWDir%%\5-0\dotnet-runtime-%dotNETver5%-win-x64.exe"          ^&^(@echo %CheckVerNET5i64s% *5-0\dotnet-runtime-%dotNETver5%-win-x64.exe^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET5b32%"         -o "%%TmDlWDir%%\5-0\dotnet-runtime-%dotNETver5%-win-x86.zip"          ^&^(@echo %CheckVerNET5b32s% *5-0\dotnet-runtime-%dotNETver5%-win-x86.zip^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat
(@echo :: @curl.exe -RL# "%CheckVerNET5b64%"         -o "%%TmDlWDir%%\5-0\dotnet-runtime-%dotNETver5%-win-x64.zip"          ^&^(@echo %CheckVerNET5b64s% *5-0\dotnet-runtime-%dotNETver5%-win-x64.zip^)^>^>"%%TmDlWDir%%\sha.sha")>> CURL_DL_dotNET5678_ForMUX.bat

@echo Done
@pause > nul