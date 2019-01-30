#!/usr/bin/env bash

NMCLI_OUTPUT="$(nmcli)"

if [[ $NMCLI_OUTPUT == *"enx5855ca25baeb: connected "* ]]; then
  echo " "
else
  echo ""
fi 

