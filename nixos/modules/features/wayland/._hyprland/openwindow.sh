#!/bin/sh

handle() {
	line=$1
	if [[ "$line" = openwindow* ]]; then
		read -r window_address workspace window_class window_title <<<$(echo "$line" | awk -F "[>,]" '{print $3,$4,$5,$6}')
		if [[ "$workspace" == special:magic && "$window_class" != kitty ]]; then
			hyprctl dispatch movetoworkspace e+0,address:0x${window_address}
		# elif [[ "$workspace" == special:music && "$window_class" != kew ]]; then
		# 	hyprctl dispatch movetoworkspace e+0,address:0x${window_address}
		# elif [[ "$workspace" == special:volume && "$window_class" != pavucontrol-qt ]]; then
		# 	hyprctl dispatch movetoworkspace e+0,address:0x${window_address}
		# elif [[ "$workspace" == special:qqmusic && "$window_title" != qqmusic ]]; then
		# 	hyprctl dispatch movetoworkspace e+0,address:0x${window_address}
		fi
	fi
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
