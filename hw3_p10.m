I1 =  imread('coins.png') ;
F = imresize(I1,0.25);
F1 = fftshift(log(abs(fft2(F))));

figure;
imagesc(flipud(F));
colormap gray
axis xy
xlabel('m')
ylabel('n')
title('Original Image');

figure;
imagesc(flipud(F1));
axis xy
xlabel('m')
ylabel('n')
title('Original Image');