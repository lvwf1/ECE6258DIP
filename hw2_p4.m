[x,y] = meshgrid(0:8:256);                                
g = 0.5+0.5* cos(2*pi*(1/8*x+1/32*y));
subplot(3,1,1);
plot(g);
title('2d cosine wave of g(x,y)');
subplot(3,1,2);
surf(x,y,g);
title('3d cosine wave of g(x,y)');
axis tight;
Hs = spectrum.periodogram
Fs = 256;
subplot(3,1,3);
psd(Hs,g,'Fs',Fs);