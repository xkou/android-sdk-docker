#!/bin/sh
[ -e /usr/local/adk/cmdline-tools ] || cp -rf /usr/local/sdk/cmdline-tools /usr/local/adk/
cd /usr/local/adk/
MAN=./cmdline-tools/latest/bin/sdkmanager
yes | $MAN --licenses
ls
