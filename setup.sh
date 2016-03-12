#!/bin/sh
curl -L -O https://github.com/dardo82/ATAF/archive/master.zip
unzip master.zip; rm master.zip; mkdir /usr/local/share/ataf/
mv ATAF-master/* /usr/local/share/ataf/; rmdir -f ATAF-master
ln -f -i -s /usr/local/share/ataf/ataf.sh /usr/local/bin/ataf
chmod a+x /usr/local/share/ataf/ataf.sh; echo "Install done."
