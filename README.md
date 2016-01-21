# ATAF

Get and speak Florence's bus system timetables.


## Shell

Run the shell script giving a bus stop code as argument.

`./ataf.sh FM0020`

Refer to http://www.temporealeataf.it/ to get them.


## Arduino

To make a bus stop that speaks at the push of a button,

you can use a RaspBerry Pi and an Arduino.

Build the circuit on a breadboard and load the sketch on the Arduino.

On the RaspBerry Pi run this at boot (appendding it to ``/etc/rc.local``):

`while true; do grep -q BS=1 /dev/cu.usbmodemfd1321 && ataf.sh FM0020; done`
