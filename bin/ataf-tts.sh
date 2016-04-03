#!/bin/zsh

BIN=${0:A}; DIR=${BIN%/*}; NAME=${${BIN##/*/}%.*}; LCD=$NAME.lcd; TTS=$NAME.tts

cd $DIR/../txt; awk '/:/{print "Sono le ore "$3"."}' $LCD > $TTS

awk -F"'|\t" /\'/'{print "Linea "$1" per "$2" \
in arrivo fra "$3" minuti."}' $LCD >> $TTS

CRED="a3aa517e-0b36-4095-bdfa-3fc85370ba0f:bwoEuQ14QCJG"
ACCEPT="audio/flac"; VOICE="it-IT_FrancescaVoice"

IBM="https://$CRED@stream.watsonplatform.net/text-to-speech\
/api/v1/synthesize?accept=$ACCEPT\&voice=$VOICE\&text="

curl $(sed "s/ /%20/g;s#^#$IBM#" $TTS) | play -q -t flac -
