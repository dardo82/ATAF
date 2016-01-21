// ATAF

int BP=13;
int BS=0;

void setup(){
    Serial.begin(9600);
    pinMode(BP,INPUT);
}
void loop(){
    BS=digitalRead(BP);
    Serial.print("BS=");
    Serial.println(BS);
    delay(1000);
}
