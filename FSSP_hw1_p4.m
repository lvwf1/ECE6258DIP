figure;
n=linspace(0,100);
x = sin(0.125*pi*n);
subplot(2,1,1);
stem(n,x);
xlabel('n');
ylabel('x[n]');
title('x[n]=sin(0.125*pi*n)');
y = sin(0.125*pi*4*n);
subplot(2,1,2);
stem(n,y);
xlabel('n');
ylabel('y[n]');
title('y[n]=x[4n]');

figure;
n=linspace(0,100);
x = sin(0.51*pi*n);
subplot(2,1,1);
stem(n,x);
xlabel('n');
ylabel('x[n]');
title('x[n]=sin(0.51*pi*n)');
y = sin(0.51*pi*4*n);
subplot(2,1,2);
stem(n,y);
xlabel('n');
ylabel('y[n]');
title('y[n]=x[4n]');

figure;
x=sin(0.125*pi*n);
subplot(2,1,1);
stem(n,x);
xlabel('n');
ylabel('y[n]');
title('y=x[n]=sin(0.125*pi*n)')
dnsample(x,4);
subplot(2,1,2);
stem(n,y);
xlabel('n');
ylabel('y[n]');
title('y=x[n]=sin(0.125*pi*n*M) M=4');

figure;
x=sin(0.51*pi*n);
subplot(2,1,1);
stem(n,x);
xlabel('n');
ylabel('y[n]');
title('y=x[n]=sin(0.51*pi*n)')
dnsample(x,4);
subplot(2,1,2);
stem(n,y);
xlabel('n');
ylabel('y[n]');
title('y=x[n]=sin(0.51*pi*n*M) M=4')

function y=dnsample(x,M)
y = zeros(floor(length(x)/M),1);
for i = 1:floor(length(x))/M
    y(i)=x(4*i);
end
end