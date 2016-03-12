# ATAF
Get and speak Florence's bus system timetables.



## Install
To install this software run the following command in the shell:

`curl https://raw.githubusercontent.com/dardo82/ATAF/master/setup.sh | sh`


## Shell
Run the shell script giving a bus stop code as argument:``ataf FM0020``.

Refer to http://www.temporealeataf.it/ to get them.


## RaspBerryPi & Arduino
To make a bus stop that speaks on demand use a RaspBerryPi and an Arduino.

Build the circuit on a breadboard and load the sketch on the Arduino.

On the RaspBerry Pi run this at boot (appendding it to ``/etc/rc.local``):

`while true; do grep -q 1 /dev/cu.usbmodemfd1321 && ataf FM0020; done &`.

Change the device file to the one of your Arduino.
