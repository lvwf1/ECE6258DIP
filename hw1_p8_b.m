w=linspace(-pi,pi)
h1=abs(2+2*cos(w));
subplot(2,2,1);
plot(w,h1);
axis([-pi,pi,0,5]);
title('figure1');

h2=abs(2+2*i*sin(w));
subplot(2,2,2);
plot(w,h2);
axis([-pi,pi,0,5]);
title('figure2');

[w1,w2]=meshgrid(linspace(-pi,pi));
h=abs(-2j*sin(w1+w2)+2j*sin(w1-w2)-4j*sin(w2));
subplot(2,2,3)
surf(w1,w2,h);
title('figure3');

h=[1,2,1;0,0,0;-1,-2,-1];
subplot(2,2,4)
freqz2(h,256,256)
title('figure4');