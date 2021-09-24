#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATH="${DIR}/../../bin:${PATH}"

APK="${DIR}/test.apk"
LOG="${DIR}/test.log"

if [ -f "$LOG" ];then
  rm -rf "$LOG"
fi

echo 'package:' >>"$LOG"
print-apk-package "$APK" >>"$LOG" 2>&1
echo '' >>"$LOG"

echo 'minsdk:' >>"$LOG"
print-apk-minsdk "$APK" >>"$LOG" 2>&1
echo '' >>"$LOG"

echo 'permissions:' >>"$LOG"
print-apk-permissions "$APK" >>"$LOG" 2>&1
