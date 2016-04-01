#!/bin/zsh
A="ataf"; MZ="master.zip"; AM=${(U)A}-${MZ/.*}; AD="/usr/local/share/$A"
curl -v -L -O -g http://github.com/dardo82/${(U)A}/archive/$MZ
unzip $MZ; rm $MZ; mkdir -p $AD; mv -r $AM/* $AD; rmdir -p $AM
ln -s $AD/bin/$A.sh /usr/local/bin/$A; chmod a+rx $AD/bin/*.sh
