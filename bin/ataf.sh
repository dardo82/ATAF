#!/bin/zsh
BIN=${0/.\//$PWD\/}; DIR=${BIN%/*}; NAME=${(L)${DIR%/*}##*/}; LCD="../txt/$NAME.lcd"; DEV=$(echo /dev/cu.usbmodem*); cd $DIR
while true; do _ataf_lcd $1; done
function _ataf_lcd () {
./$NAME-lcd.sh $1; while true; do grep -q 1 $DEV && ./$NAME-tts.sh $1; done &
SLNR=$(awk END{print\ NR-1} $LCD); cat $DEV > /dev/null &; awk END{print} $LCD > $DEV
awk "BEGIN{slnr=$SLNR;dev=\"$DEV\"}"'NR<slnr{print "echo -n -e \"\\xFE\\xC0"$0"\" > "dev"; sleep "60/(slnr-1)";"}' $LCD | sh
echo -n -e "\xFE\x01" > $DEV; kill %%; kill %% }
