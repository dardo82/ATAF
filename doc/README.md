# ATAF
Get and speak Florence's bus system timetables.



## Arduino
To make a bus stop that shows timetables and speaks them use an Arduino Yùn.

I've used an Uno so the ethernet part of the sketch is missing from the ino.

Build the circuit on a breadboard then load the sketch on the Arduino board.


## Install
To install this software run the following command in ZSH:

`curl -L raw.githubusercontent.com/dardo82/ATAF/master/bin/install.sh | zsh`


## Shell (ZSH)
The script needs a bus stop code as argument:``ataf FM0571 &``.

Refer to http://www.temporealeataf.it/ to get them.
