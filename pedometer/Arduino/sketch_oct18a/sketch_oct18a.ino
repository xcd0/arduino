void setup() {
  // put your setup code here, to run once:
  pinMode(13,OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  int ans;

  ans = analogRead(0);
  if(ans >= 700){
    //光が値より暗くなったなら処理
    digitalWrite(6,HIGH);
  }
  else{
    digitalWrite(6,LOW);
  }
  

}
