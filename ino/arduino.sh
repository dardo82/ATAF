#!/bin/zsh

A=arduino; B=build; HW=hardware; T=tools;
AA=${(C)A}.app; INOD=${1%/*}; rm -frv $INOD/$B; mkdir $INOD/$B
cd $(stat -f %Y $(locate $AA | grep -m1 $AA\$))/Contents/Java/
FAOD=$1$OLDPWD/; INOF=${FAOD:#/*}$1; BPATH=${FAOD:#/*}$INOD/$B
$A-${B}er -$HW=$HW -$T=$T-${B}er -$T=$HW/$T/avr -libraries=libraries -$B-path=${BPATH/$1} -fqbn=${A}:avr:uno -verbose ${${INOF/$1}:-$1}
avrdude -C$HW/$T/avr/etc/avrdude.conf -v -patmega328p -c$A -P$(ls /dev/cu.usbmodem*) -b115200 -D -Uflash:w:$(ls ${BPATH/$1}/*ino.hex):i
