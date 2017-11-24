
function[ output, t ] = hw( input, fc, order )
	Fs = 44100;
	M = 2 * order;
	n = 0 : 1 : M;

	h1 = 2 * fc / Fs * sin( 2 * pi * fc / Fs * ( n - order ) );
	h2 = 2 * pi * fc / Fs * ( n - order );

	for i = 1 : M+1
		if ( i - 1 - order != 0 )
			h( i ) = h1( i )  /  h2( i );
		else
			h( i ) = 2 * fc / Fs;
		end
	end

	win = hamming( M + 1 );
	hw = h.*win';

	t = 0 : 1 / Fs : 1;

	output = conv( input, hw );
end

