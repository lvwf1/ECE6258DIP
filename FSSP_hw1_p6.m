figure;
syms t w
f = exp(-1000*abs(t));
fourier(f, t, w)
w=linspace(-10000,10000);
plot(w, fourier(f, t, w));
xlabel('Frequency (Hz)')
ylabel('Amplitude') 
title('x(t) Continuous Time Signal Fourier Transform')


figure;
t=linspace(0,0.01);
fs1=5000; %fs1 =5000 samples/sec
n1=0:1/fs1:0.01; %time index
f = exp(-1000*abs(t));
f1 = exp(-1000*abs(n1));
dtft(f1,n1,w);
subplot(2,1,1);
plot(t,f);
hold on
stem(n1,f1);
xlabel('Time (s)')
ylabel('Amplitude') 
title('x(t) Discrete Time Signal Sampling by fs1 =5000 samples/sec x1(n) Fourier Transform')
subplot(2,1,2);
plot(w,dtft(f1,n1,w));
xlabel('Frequency (Hz)')
ylabel('Amplitude') 
title('x1(n) Discrete Time Fourier Transform')

figure;
t=linspace(0,0.01);
fs2=1000; %fs2 =1000 samples/sec
n2=0:1/fs2:0.01; %time index
f = exp(-1000*abs(t));
f2 = exp(-1000*abs(n2));
dtft(f2,n2,w);
subplot(2,1,1);
plot(t,f);
hold on
stem(n2,f2);
xlabel('Time (s)')
ylabel('Amplitude') 
title('x(t) Discrete Time Signal Sampling by fs2 =1000 samples/sec x2(n) Fourier Transform')
subplot(2,1,2);
plot(w,dtft(f2,n2,w));
xlabel('Frequency (Hz)')
ylabel('Amplitude') 
title('x2(n) Discrete Time Fourier Transform')


function [ X ] = dtft( x, n, w )
% [X] = dtft(x, n, w)
% X = DTFT values computed at w frequencies
% x = finite duration sequence over n
% n = sample position vector
% w = frequency location vector

temp = w' * n;
temp = -1i * temp;

e = exp(temp);

X = e * x';

end