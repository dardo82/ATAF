#!/usr/local/bin/zsh

s=$(echo -n $(($(date +%s)-$(date +%s)%$(($((60*60))/4))))r3x1m_ataf | openssl sha1)
ATAF="http://www.temporealeataf.it/Mixer/Rest/PublicTransportService.svc/schedule?nodeID=$1&lat=43.8&lon=11.2&s=$s"

STAT=$(stat -f %Y $0); cd ${${STAT:-$0}%/*}; curl -s $ATAF > ataf.json; m=$(date -u '+%R' | awk -F: '{print (($1*60)+$2)}')
awk -F\" -v RS='{|}' -v m=$m '{if (l!~$12) print $12"\t"$20"\t"((($4/1000)/60)-m); l=l$12}' ataf.json | expand -t 5,30 > ataf.lcd
echo \\n${(U)${$(date '+%a %x %X')//.//}%:*} >> ataf.lcd

awk '/:/{print "Sono le ore "$3"."}' ataf.lcd > ataf.tts
awk '/^[0-9A-Z]{2} /{cl=""; for (i=2; i<=NF-1; ++i) cl=cl" "$i; print "Linea "$1" per"cl" in arrivo fra "$NF" minuti."}' ataf.lcd >> ataf.tts

CRED="a3aa517e-0b36-4095-bdfa-3fc85370ba0f:bwoEuQ14QCJG"; ACCEPT="audio/flac"; VOICE="it-IT_FrancescaVoice"
TTS="https://$CRED@stream.watsonplatform.net/text-to-speech/api/v1/synthesize?accept=$ACCEPT\&voice=$VOICE\&text="
curl -s $(sed "s/ /%20/g;s#^#$TTS#" ataf.tts) | play -t flac -
