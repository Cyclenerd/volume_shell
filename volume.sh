#!/bin/bash

# Change system volume

# volume.sh
# Author: Nils Knieling - https://github.com/Cyclenerd/volume_shell


me=$(basename "$0")

function usage {
	returnCode="$1"
	echo "Usage: $me PERCENT"
	echo "Percentage without % and between 0 to 100. mute and unmute also works."
	exit "$returnCode"
}

### Check Commands
command -v amixer >/dev/null 2>&1 || { echo >&2 "!!! amixer it's not installed.  Aborting."; exit 1; }

amixer="amixer -q set Master"

case $1 in
	0)
		$amixer mute
		;;	
	# Percent
	[1-9]|[1-9][0-9]|100)
		$amixer unmute
		$amixer "$1%"
		;;
	# Mute
	mute)
		$amixer mute
		;;	
	# Unmute
	unmute)
		$amixer unmute
		;;
	# Help
	*)
		usage 1
		;;
esac
