#!/usr/bin/env bash

PGREP_OUTPUT="$(pgrep spotify)"

if [ -z "$PGREP_OUTPUT" ]; then
	echo ""
else
	if [[ "$1" == "right" ]]; then
 		echo "◤"
	else
  		echo "◢"
	fi 
fi 