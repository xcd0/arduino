void setup() {
  // put your setup code here, to run once:
     pinMode(13,OUTPUT) ;
}

void loop() {
  // put your main code here, to run repeatedly:
     int ans ;

  // unko
     ans = analogRead(0) ;
     if (ans >= 700) {
          digitalWrite(13, HIGH) ;
      } else {
          digitalWrite(13, LOW) ;
      }
}
