@echo off

set PATH=%~dp0..\..\bin;%PATH%

set apk="%~dpn0.apk"
set log="%~dpn0.log"

if exist %log% del /Q %log%

echo package:>>%log%
call print-apk-package %apk% >>%log% 2>&1
echo.>>%log%

echo version:>>%log%
call print-apk-version %apk% >>%log% 2>&1
echo.>>%log%

echo minsdk:>>%log%
call print-apk-minsdk %apk% >>%log% 2>&1
echo.>>%log%

echo permissions:>>%log%
call print-apk-permissions %apk% >>%log% 2>&1
