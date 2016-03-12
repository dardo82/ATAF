#!/bin/zsh
# Get and speak Florence's bus system timetables

t=$(date '+%s').0; float -F 1 rt=$(($t/(((60*60)/4)*10))); s=$(echo -n ${$(($rt*((60*60)/4)*10))/./}r3x1m_ataf | openssl sha1)
ATAF="http://www.temporealeataf.it/Mixer/Rest/PublicTransportService.svc/schedule?nodeID=$1&lat=43.8&lon=11.2&s=$s"

cd ${0%/*}; curl -s $ATAF > ataf.json; m=$(date -u '+%R' | awk -F: '{print (($1*60)+$2)}')
awk -F\" -v RS='{|}' -v m=$m '{if (l!~$12) print $12"\t"$20"\t"((($4/1000)/60)-m); l=l$12}' ataf.json | expand -t 5,30 > ataf.lcd
echo -e \\n${(U)${$(date '+%a %x %X')//.//}%:*} >> ataf.lcd

awk '/:/{print "Sono le ore "$3"."}' ataf.lcd > ataf.tts
awk '/^[[:alnum:]]{2} /{cl=""; for(i=2; i<=NF-1;++i)cl=cl" "$i; print "Linea "$1" per"cl" in arrivo fra "$NF" minuti."}' ataf.lcd >> ataf.tts

CRED="a3aa517e-0b36-4095-bdfa-3fc85370ba0f:bwoEuQ14QCJG"; ACCEPT="audio/flac"; VOICE="it-IT_FrancescaVoice"
TTS="https://$CRED@stream.watsonplatform.net/text-to-speech/api/v1/synthesize?accept=$ACCEPT\&voice=$VOICE\&text="
curl $(sed "s/ /%20/g;s#^#$TTS#" ataf.tts) | play -t flac -
