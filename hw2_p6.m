[n1,n2]=meshgrid(-100:1:100,-100:1:100);
x=4+2*cos((2*pi/8)*(n1+n2))+2*cos((2*pi/8)*(n1-n2));
f=fft2(x, n1, n2)
