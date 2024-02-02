@cd core
@ECHO OFF
(
@echo ' VBScript.
@echo Set Shell = CreateObject^("WScript.Shell"^)
@echo DesktopPath = Shell.SpecialFolders^("Desktop"^)
@echo Set link = Shell.CreateShortcut^(DesktopPath ^& "\Firefox with params.lnk"^)
@echo link.Arguments = " -no-remote -profile ..\portable %*"
@echo link.Description = "Firefox"
@echo 'link.HotKey = "CTRL+ALT+SHIFT+F"
@echo link.IconLocation = "%~dp0Firefox.exe,0"
@echo link.TargetPath = "%~dp0Firefox.exe"
@echo link.WindowStyle = 0
@echo link.WorkingDirectory = "%~dp0"
@echo link.Save
)>Link_Desktop_Firefox.vbs
@Link_Desktop_Firefox.vbs
@del /f /q Link_Desktop_Firefox.vbs