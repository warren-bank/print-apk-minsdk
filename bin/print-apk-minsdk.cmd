@echo off

set PATH=%~dp0..\tools;%PATH%

if [%1]==[] (
  echo error: path to APK file is a required parameter
  echo usage: print-apk-minsdk "/path/to/file.apk"
  exit /b 0
)

set apk_path="%~1"

if not exist %apk_path% (
  echo error: path to APK file does not exist
  echo usage: print-apk-minsdk "/path/to/file.apk"
  exit /b 0
)

rem :: =====================================================
rem :: https://stackoverflow.com/questions/20372193
rem :: =====================================================

rem :: =====================================================
rem :: https://stackoverflow.com/a/31693172
rem :: aapt list -a %apk_path%
rem :: =====================================================
rem :: notes:
rem :: - for an arbitrary test.apk
rem ::   * 3391 lines of output
rem ::   * minSdkVersion and targetSdkVersion are in hex
rem ::       A: android:minSdkVersion(0x0101020c)=(type 0x10)0xf
rem ::       A: android:targetSdkVersion(0x01010270)=(type 0x10)0x12
rem ::   * minSdkVersion:
rem ::       0xf  == 15
rem ::   * targetSdkVersion:
rem ::       0x12 == 18
rem :: =====================================================

rem :: =====================================================
rem :: https://stackoverflow.com/a/46655143
rem :: aapt dump badging %apk_path%
rem :: =====================================================
rem :: notes:
rem :: - for an arbitrary test.apk
rem ::   * 89 lines of output
rem ::   * minSdkVersion and targetSdkVersion are in decimal
rem ::     - sdkVersion:'15'
rem ::     - targetSdkVersion:'18'
rem :: =====================================================

aapt dump badging %apk_path% | grep sdkVersion | grep -oP "\d+"
