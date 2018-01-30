f=40; %Frequency of sinusoid
fs=10e3; %Very high sampling rate 500 kHz
nCyl=4; %generate five cycles of sinusoid
t=0:1/fs:nCyl*1/f; %time index
fs1=1/0.02; %Ts=0.02s sampling rate
t1=0:1/fs1:nCyl*1/f; %time index
fs2=1/0.005; %Ts=0.005s sampling rate
t2=0:1/fs2:nCyl*1/f; %time index
fs3=1/0.0001; %Ts=0.0001s sampling rate
t3=0:1/fs3:nCyl*1/f; %time index
x = 20 * cos(2*pi*f*t-0.4*pi);
x1 = 20 * cos(2*pi*f*t1-0.4*pi);
x2 = 20 * cos(2*pi*f*t2-0.4*pi);
x3 = 20 * cos(2*pi*f*t3-0.4*pi);
subplot(3,1,1)
plot(t,x)
hold on;
plot(t1,x1)
axis([0 0.1 -25 25])
xlabel('Time (sec)')
ylabel('Amplitude') 
title('Continuous sinusoidal signal Ts=0.02s')
subplot(3,1,2)
plot(t,x)
hold on;
plot(t2,x2)
axis([0 0.1 -25 25])
xlabel('Time (sec)')
ylabel('Amplitude') 
title('Continuous sinusoidal signal Ts=0.005s')
subplot(3,1,3)
plot(t,x)
hold on;
plot(t3,x3)
axis([0 0.1 -25 25])
xlabel('Time (sec)')
ylabel('Amplitude') 
title('Continuous sinusoidal signal Ts=0.0001s')