#!/bin/zsh

s=$(echo -n $(($(date '+%s')-$(date '+%s')%$(($((60*60))/4))))r3x1m_ataf | openssl sha1); D=$(date '+%a %d/%m  %R')
ATAF="http://www.temporealeataf.it/Mixer/Rest/PublicTransportService.svc/schedule?nodeID=$1&lat=43.8&lon=11.2&s=$s"

LINK=$(readlink $0); DIR=${${LINK:-$0}%/*}; cd $DIR/../txt; curl -s $ATAF > ataf.json; m=$(date -u '+%R' | awk -F: '{print (($1*60)+$2)}')
awk 'BEGIN{FS="\""; RS="{|}"; m='$m'}{if (l!~$12) printf "%s\t%s\t%2d'"'"'\n", $12, $20, ((($4/1000)/60)-m); l=l$12}' ataf.json > ataf.lcd
echo -e \\n${(U)D} >> ataf.lcd
