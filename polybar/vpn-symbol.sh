#!/usr/bin/env bash

VPN_OUTPUT="$(ip link show tap0 2>&1)"

if [[ $VPN_OUTPUT == *"does not exist"* ]]; then
  echo ""
else
  echo " "
fi 