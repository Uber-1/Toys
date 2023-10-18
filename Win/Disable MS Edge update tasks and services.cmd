@echo off
@echo Disable MS Edge update tasks and services
:: schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineUA" /Disable
:: schtasks /Change /TN "MicrosoftEdgeUpdateTaskMachineCore" /Disable
 taskkill /f /im MicrosoftEdgeUpdate.exe
 taskkill /f /im msedge.exe
 sc delete edgeupdate
 sc delete edgeupdatem
 sc delete MicrosoftEdgeElevationService
 schtasks /delete /TN "MicrosoftEdgeUpdateTaskMachineCore" /f
 schtasks /delete /TN "MicrosoftEdgeUpdateTaskMachineUA" /f
 rd /s /q "%PROGRAMFILES(x86)%\Microsoft\EdgeUpdate"
 rd /s /q "%PROGRAMFILES%\Microsoft\EdgeUpdate"
@pause