// include the library header
#include <LiquidCrystal.h>

// initialize the library setting the LCD's pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  // set the speed for the serial transmission
  Serial.begin(9600);

  // set the the mode for the button's pin
  pinMode(13,INPUT);

  // set the LCD's number of rows and columns
  lcd.begin(16, 2);

  // clear the LCD screen and reset the cursor
  lcd.clear();
}

void loop() {
  // define a variable and initialize it to 0
  byte rxbyte=0x00;

  if (Serial.available()>0) { // if it is available
    rxbyte=Serial.read(); // fetch a byte or char

    if (rxbyte==0xFE) { // if it marks the start of a command
      lcd.command(Serial.read()); } // then pass it through
    else {
      lcd.write(rxbyte); }} // otherwise just dump it as text

  // print the state of the button
  Serial.println(digitalRead(13));

  //wait 200 milliseconds before starting it all over again
  delay(200);
}
