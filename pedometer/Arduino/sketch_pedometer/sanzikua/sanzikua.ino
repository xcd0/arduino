void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int i, a;
  long x, y, z;
  while(1){ 
    /*
    x = analogRead(3);
    y = analogRead(4);
    z = analogRead(5); 
    */
    x=y=z=0;
    for(i=0; i<100; i++) {
      x += analogRead(3);
      y += analogRead(4);
      z += analogRead(5); 
    }
    x=x/100;
    y=y/100;
    z=z/100;
    
    Serial.print(x) ;
    Serial.print(",");
    Serial.print(y) ;
    Serial.print(",");
    Serial.println(z) ;
    /*
    a=atan2(x-507,z-558) / 3.14159 *180.0 ;
    Serial.print(a) ;
    Serial.print(",");
    a=atan2(y-520, z-558) / 3.14159 *180.0 ;
    Serial.println(a) ;
    */
    delay(1);
  }
}


