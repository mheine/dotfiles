#!/usr/bin/env bash

BLUETOOTH_OUTPUT=$(echo "info" | bluetoothctl)

if [[ $BLUETOOTH_OUTPUT == *"Connected: yes"* ]]; then
  echo ""
else
  echo ""
fi 