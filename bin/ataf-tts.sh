#!/bin/zsh

LINK=$(readlink $0); DIR=${${LINK:-$0}%/*}; cd $DIR/../txt; awk '/:/{print "Sono le ore "$3"."}' ataf.lcd > ataf.tts
awk -F"'|\t" /\'/'{print "Linea "$1" per "$2" in arrivo fra "$3" minuti."}' ataf.lcd >> ataf.tts

CRED="a3aa517e-0b36-4095-bdfa-3fc85370ba0f:bwoEuQ14QCJG"; ACCEPT="audio/flac"; VOICE="it-IT_FrancescaVoice"
TTS="https://$CRED\@stream.watsonplatform.net/text-to-speech/api/v1/synthesize\?accept=$ACCEPT\&voice=$VOICE\&text="
curl -s $(sed "s/ /%20/g;s#^#$TTS#" ataf.tts) | play -q -t flac -
