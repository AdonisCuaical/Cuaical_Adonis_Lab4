#include <SoftwareSerial.h>
SoftwareSerial myPort(2, 3); // 2 = Tx 3= Rx
int p; 
boolean t=false; 
void setup() {
  pinMode(2, INPUT);
  pinMode(3, OUTPUT);
  Serial.begin(9600);
  myPort.begin(9600);
  Serial.println("Ingrese su estatura: ");
}
void loop() {
  if (Serial.available() > 0) {
    delay(200); 
    p=Serial.readString().toInt(); 
    t=true; 
    }else if(t==true){
    myPort.write(p);
    Serial.println(" "); 
    Serial.println("Ingrese su estatura: ");
    t=false; 
      }
}
