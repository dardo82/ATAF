#!/bin/zsh

function _ataf_lcd () {

	./$NAME-lcd.sh $1; while true; do grep -q 1 $DEV && ./$NAME-tts.sh $1; done &;

	SLNR=$(awk 'END{print NR-1}' $LCD); cat $DEV > /dev/null &; sleep 2; awk 'END{print}' $LCD > $DEV;

	awk -F\\t '/'"'"'$/{printf "%s\t%.8s\t%s\n",$1,$2,$3; for (i=1;i<=1+length($2)-8;i++) printf "%s\n",substr($2,i,8)}' $LCD \
	| expand -t 4,13 | awk '{if ($0~/'"'"'$/) printf "\xFE\xC0%s",$0; else printf "\xFE\xC4%s",$0; system("sleep 2")}' > $DEV;

	echo -n -e "\xFE\x01" > $DEV; kill %%; sleep 2; kill %%; }

BIN=${0:A}; DIR=${BIN%/*}; NAME=${${${BIN##/*/}%.*}%%-*}; LCD="../txt/$NAME.lcd"; DEV=(/dev/cu.usbmodem*)

cd $DIR; while true; do _ataf_lcd $1; done &
