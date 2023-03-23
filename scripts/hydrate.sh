#!/usr/bin/env bash
export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/$(id -u)

/usr/bin/notify-send "Reminder:" "Have a drink of water\!"

