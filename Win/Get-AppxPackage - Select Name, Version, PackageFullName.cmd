@echo off
@mode con cols=160 lines=50
@echo Get-AppxPackage . . .
@PowerShell -Command "Get-AppxPackage | Select Name, Version, PackageFullName" > Get-AppxPackage.txt
