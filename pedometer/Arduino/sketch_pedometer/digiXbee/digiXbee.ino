void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int ans, temp, tv;

  ans=analogRead(0);
  tv=map(ans,0,1023,0,5000);
  temp=map(tv,300,1600,-30,100);
  Serial.println(temp);
  delay(1000);
}
