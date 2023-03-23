#!/usr/bin/env bash

if ! [ -x "$(command -v i3-msg)" ]; then
 	echo 'Error: i3 is not installed.' >&2
 	exit 1
fi

blueman-manager &
sleep 0.5
pavucontrol &
sleep 0.5


# i3-msg '[class="(?i)Blueman-manager"] focus'
# i3-msg floating enable resize set 1500 1200
# i3-msg move position center
# i3-msg move left 1000 px

# sleep 0.2

# i3-msg '[class="(?i)pavucontrol"] focus'
# i3-msg floating enable resize set 1500 1200
# i3-msg move position center
# i3-msg move right 1000 px

# sleep 0.2

exit 0