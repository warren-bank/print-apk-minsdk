@echo off

set PATH=%~dp0..\..\tools;%PATH%

echo sdkVersion:'15'| grep sdkVersion | grep -oP "\d+"

echo.
pause
