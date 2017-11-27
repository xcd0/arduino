clear;

data3d = load("highspeed.txt");

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
%order = 256;
order = 6;

data_1d_t = x + y + z;

data_1d = data_1d_t';

dataSize = length( data_1d );
ave = mean( data_1d, "a" );

for i = 1 : dataSize
	data(i) = data_1d(i) - ave;
endfor

%save -text data_1d.tsv data_1d;

%-----------------------------------------------------------

%t = linspace( 0, 100, length(data_1d) );

plot( data_1d );

figure_start_x = 300;
figure_end_x = 400;
axis( [ figure_start_x, figure_end_x ] );
grid;

print -depsc data_1d.eps;

%-----------------------------------------------------------

lpf = ones( 1, dataSize - order );

i = 1;
for( i = 1 : dataSize - order )
	tmp3 = data_1d(i);
	for( j = 1 : order )
		tmp3 = tmp3 + data_1d( i + j );
	endfor
	lpf(i) = tmp3 / order;
	i++;
endfor


%-----------------------------------------------------------

%t = linspace( 0, 100, length( lpf ) );

plot( lpf );
axis( [ figure_start_x, figure_end_x ] );
grid;
print -depsc data_1d_lpf.eps;

%save -text data_1d_lpf.tsv lpf;


plot( lpf );
axis( [ 300,400] );
grid;
print -depsc data_1d_lpf_100.eps;

%-----------------------------------------------------------

lpf_fft = abs( fft( lpf ) );
ampMax = max( lpf_fft );

t = linspace( 0, 20, length( lpf_fft ) );
plot( t, 20 * log10( lpf_fft / ampMax ) );
axis( [ 0,3 ] );
grid;
print -depsc test_fft.eps;


