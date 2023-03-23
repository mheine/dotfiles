#!/usr/bin/env bash

NMCLI_OUTPUT="$(nmcli)"

if [[ $NMCLI_OUTPUT =~ (enx)(.*)(: connected to) ]]; then
  echo " "
else
  echo ""
fi 

