# ATAF
Get and speak Florence's bus system timetables.



## Install
To install this software run the following command in ZSH:

`curl https://raw.githubusercontent.com/dardo82/ATAF/master/setup.sh | zsh`


## Shell (ZSH)
The script needs a bus stop code as argument:``ataf FM0571``.

Refer to http://www.temporealeataf.it/ to get them.


## RaspBerryPi & Arduino
To make a bus stop that speaks on demand use a RaspBerryPi and an Arduino.

Build the circuit on a breadboard and load the sketch on the Arduino.

On the RaspBerry Pi run this at boot (appendding it to ``/etc/rc.local``):

`while true; do grep -q 1 /dev/cu.usbmodem* && ataf FM0571; done &`.

Note: set the right device file if you have more than one Arduino connected.
