clear;

data3d = load("data1.txt");

x = data3d( :, 1 );
y = data3d( :, 2 );
z = data3d( :, 3 );

%{
plot( x, 'r' );
hold on;
plot( y, 'b' );
plot( z, 'g' );

grid on;

xlabel( "Time" );
ylabel( "atai" );
legend( 'X', 'Y', 'Z' );
print -depsc 81po.eps;
%}

% 50ms
Fs = 20;
order = 256;

data_1d_t = x + y + z;

data_1d = data_1d_t';

dataSize = length( data_1d );
ave = mean( data_1d, "a" );

for i = 1 : dataSize
	data(i) = data_1d(i) - ave;
endfor

save -text data_1d.tsv data_1d;


t = linspace( 0, 100, length(data_1d) );
axis( [ 0, 100 ] );
grid;
plot( t, data_1d );
print -depsc data_1d.eps;


lpf = ones( 1, dataSize - order );

i = 1;
for( i = 1 : dataSize - order )
	tmp3 = data_1d(i);
	for( j = 1 : order )
		tmp3 = data_1d( i + j );
	endfor
	lpf(i) = tmp3 / order;
	i++;
endfor

t = linspace( 0, 100, length( lpf ) );


save -text data_1d_lpf.tsv lpf;
plot( t, lpf );

print -depsc data_1d_lpf.eps;
lpf_fft = abs( fft( lpf ) );



lpf_fft = abs( fft( lpf ) );

ampMax = max( lpf_fft );


t = linspace( 0, 20, length( lpf_fft ) );
plot( t, 20 * log10( lpf_fft / ampMax ) );
axis( [ 0,3 ] );
grid;
print -depsc test_fft.eps;


