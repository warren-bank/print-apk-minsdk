@echo off

set PATH=%~dp0..\..\bin;%PATH%

set apk="%~dpn0.apk"
set log="%~dpn0.log"

call print-apk-minsdk %apk% >%log% 2>&1
