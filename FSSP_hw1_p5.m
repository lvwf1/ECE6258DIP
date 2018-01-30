figure;
n=0:1:10;
x=(0.9*exp(1j*pi/3)).^n;
subplot(2,1,1);
stem(n,x);
xlabel('n')
ylabel('x(n)') 
title('x(n) Discrete Time Signal')
w = linspace(-2*pi,2*pi);
subplot(2,1,2);
plot(w,dtft(x,n,w));
xlabel('Frequency (Hz)')
ylabel('Amplitude') 
title('x(w) Discrete Time Signal Fourier Transform')

function [ X ] = dtft( x, n, w )
% [X] = dtft(x, n, w)
% X = DTFT values computed at w frequencies
% x = finite duration sequence over n
% n = sample position vector
% w = frequency location vector
temp = w' * n;
temp = -1j * temp;
e = exp(temp);
X = e * x';
end