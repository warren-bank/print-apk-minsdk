#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATH="${DIR}/../../bin:${PATH}"

APK="${DIR}/test.apk"
LOG="${DIR}/test.log"

print-apk-minsdk "$APK" >"$LOG" 2>&1
