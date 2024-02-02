@echo.
@echo "C:\ProgramData\Mozilla-1de4eec8-1241-4177-a864-e594e8d1fb38"
@rd /q /s "C:\ProgramData\Mozilla-1de4eec8-1241-4177-a864-e594e8d1fb38"
@type > "C:\ProgramData\Mozilla-1de4eec8-1241-4177-a864-e594e8d1fb38"
@attrib +r "C:\ProgramData\Mozilla-1de4eec8-1241-4177-a864-e594e8d1fb38"

@echo.
@echo AppData
@rd /s "%LOCALAPPDATA%\Mozilla\"
@rd /s "%AppData%\Mozilla\Firefox\"
@rd /s "%AppData%\Mozilla\Extensions\"
@reg delete "HKEY_CURRENT_USER\Software\Mozilla\Firefox" /f

@echo.
@echo "C:\ProgramData\Waterfox-1de4eec8-1241-4177-a864-e594e8d1fb38"
@rd /q /s "C:\ProgramData\Waterfox-1de4eec8-1241-4177-a864-e594e8d1fb38"
@type > "C:\ProgramData\Waterfox-1de4eec8-1241-4177-a864-e594e8d1fb38"
@attrib +r "C:\ProgramData\Waterfox-1de4eec8-1241-4177-a864-e594e8d1fb38"

@echo.
@echo AppData
@rd /s "%LOCALAPPDATA%\Waterfox\"
@rd /s "%AppData%\Waterfox\"
@reg delete "HKEY_CURRENT_USER\Software\WaterfoxLimited" /f
