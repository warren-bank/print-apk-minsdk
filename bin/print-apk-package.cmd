@echo off

set PATH=%~dp0..\tools;%PATH%

if [%1]==[] (
  echo error: path to APK file is a required parameter
  echo usage: print-apk-package "/path/to/file.apk"
  exit /b 0
)

set apk_path="%~1"

if not exist %apk_path% (
  echo error: path to APK file does not exist
  echo usage: print-apk-package "/path/to/file.apk"
  exit /b 0
)

rem :: =====================================================
rem :: https://stackoverflow.com/a/6289168
rem :: aapt dump badging %apk_path%
rem :: =====================================================

aapt dump badging %apk_path% | grep "package:" | grep -oP " name='[^']+'" | grep -oP "'[^']+'" | grep -oP "[^'\r\n]+"
