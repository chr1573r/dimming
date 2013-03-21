#!/bin/bash

# dimming.sh
# Slår av og på strømsparingsfunksjoner (Energy Star) for skjerm
# Christer J 2013
#
# Bruksanvisning:
#
# For å aktivere strømsparingsfunksjonene (automatisk dimming av skjerm):
# ./dimming.sh på
#
# For å deaktivere strømsparingsfunksjonene (unngå at skjerm slukkes):
# ./dimming.sh av

# Variabler:
# Brukes ved logging (Logpath må endres til gyldig sti for din maskin)
TIMESTAMP=$(date +"%d.%m.%Y - %H:%M:%S")
LOGPATH=/home/administrator/dimmelog.txt
# Angi X-server (Dette er essensielt når skriptet eksekveres via cron)
export DISPLAY=:0.0

case "$1" in

	av)
		echo $TIMESTAMP: Deaktiverte strømsparing >>$LOGPATH
		/usr/bin/xset dpms force on
		/usr/bin/xset -dpms
		;;
	på)
		echo $TIMESTAMP: Aktiverte strømsparing >>$LOGPATH
		/usr/bin/xset dpms force off
		/usr/bin/xset dpms
		;;
	*)
		echo Ugyldig syntaks! Bruk "dimming.sh av" eller "dimming.sh på"
		;;
esac

