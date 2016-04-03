#!/bin/zsh

s=$(echo -en $(($(date '+%s')-$(date '+%s')%((60*60)/4)))r3x1m_ataf \
| openssl sha1); DATE=$(date '+%a %d/%m  %R')

ATAF="http://temporealeataf.it/Mixer/Rest/PublicTransportService.svc\
/schedule?nodeID=$1&lat=43.8&lon=11.2&s=$s"

BIN=${0:A}; DIR=${BIN%/*}; NAME=${${${BIN##/*/}%.*}%%-*}; LCD="$NAME.lcd"; JSON="$NAME.json"

cd $DIR/../txt; curl -s $ATAF > $JSON; MIN=$(date -u '+%R' | awk -F: '{print (($1*60)+$2)}')

awk 'BEGIN{FS="\""; RS="{|}"; min='$MIN'}{if (l!~$12) printf "%s\t%s\t%2d'"'"'\n"\
, $12, $20, ((($4/1000)/60)-min); l=l$12}' $JSON > $LCD

echo -en \\n${(U)DATE} >> $LCD
