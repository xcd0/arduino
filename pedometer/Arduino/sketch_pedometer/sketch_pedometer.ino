void setup() {
  // put your setup code here, to run once:
     Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
     int i, a;
     long x = 0, y = 0, z = 0;

     for( i = 0; i < 100; i++ ){
      x += analogRead( 3 );
     }
     ans = analogRead(0) ;
     if (ans >= 700) {
          digitalWrite(13, HIGH) ;
      } else {
          digitalWrite(13, LOW) ;
      }
      Serial.println(ans);
}
