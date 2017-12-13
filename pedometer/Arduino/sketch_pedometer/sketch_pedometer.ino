void setup() {
	// put your setup code here, to run once:
	Serial.begin(9600);
}

void loop() {
	// put your main code here, to run repeatedly:
	int i, j;
	long data[3] = { 0, 0, 0 };

	for( i = 0; i < 100; i++ ){
		for( j = 0; j < 3; j++ ){
			data[ j ] += analogRead( 3 + j );
		}
	}
	Serial.print( data[ 0 ], ",", data[ 1 ], ",",data[ 2 ], "\n" );
}
