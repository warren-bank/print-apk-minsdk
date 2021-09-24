@echo off

set PATH=%~dp0..\tools;%PATH%

if [%1]==[] (
  echo error: path to APK file is a required parameter
  echo usage: print-apk-permissions "/path/to/file.apk"
  exit /b 0
)

set apk_path="%~1"

if not exist %apk_path% (
  echo error: path to APK file does not exist
  echo usage: print-apk-permissions "/path/to/file.apk"
  exit /b 0
)

rem :: =====================================================
rem :: https://android.stackexchange.com/a/9779
rem :: aapt dump permissions %apk_path%
rem :: =====================================================

aapt dump permissions %apk_path% | grep -P "uses-permission:" | grep -oP "name='[^']+'" | grep -oP "[^']{6,}"
