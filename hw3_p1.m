% ECE 6258: Digital Image Processing
% School of Electrical and Computer Engineering
% Georgia Institute of Technology
% Prof. Ghassan Alregib
% Last updated on 9/15/2017 by Motaz Alfarraj (motaz@gatech.edu)

%% Initilization
clc;
clear all;
close all;
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%YOUR EDITS ARE ONLY NEEDED IN THIS SECTION
%replace %ADD LINE% with the a line of code to do the ewquired step in
% the question statement

I1 =  imread('WiseBird.jpg') ;
if size(I1,3)~=1
  I1 = rgb2gray(I1);
end
I1 = double(I1);
F1 = fft(I1);

F2 = F1(1:1:end,1:2:end);%F2 = downsample(F1',2)';
I2 = ifft(F2);
I2 = real(I2);

F3 = F1(1:2:end,1:1:end);%F3 = downsample(F1,2);
I3 = ifft(F3);
I3 = real(I3);

F4 = F1(1:2:end,1:2:end);%F4 = downsample(downsample(F1',2)',2);
I4 = ifft(F4);
I4 = real(I4);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(221)
imagesc(flipud(I1))
colormap gray
axis xy
xlabel('m')
ylabel('n')
title('Original Image');

subplot(222)
imagesc(flipud(I2))
colormap gray
axis xy
xlabel('m')
ylabel('n')
title('Horizontally-Downsampled in Frequency');

subplot(223)
imagesc(flipud(I3))
colormap gray
axis xy
xlabel('m')
ylabel('n')
title('Vertically-Downsampled in Frequency');

subplot(224)
imagesc(flipud(I4))
colormap gray
axis xy
xlabel('m')
ylabel('n')
title('Downsampled in Frequency');
figure

subplot(221)
imagesc(fftshift(log(abs(F1))));
axis xy
xlabel('Horizontal Frequency')
ylabel('Vertical Frequency')
title('Original Fourier Transform');

subplot(222)
imagesc(fftshift(log(abs(F2))));
axis xy
xlabel('Horizontal Frequency')
ylabel('Vertical Frequency')
title('Horizontally-downsampled Fourier Transform');

subplot(223)
imagesc(fftshift(log(abs(F3))));
axis xy
xlabel('Horizontal Frequency')
ylabel('Vertical Frequency')
title('Vertically-downsampled Fourier Transform');

subplot(224)
imagesc(fftshift(log(abs(F4))));
axis xy
xlabel('Horizontal Frequency')
ylabel('Vertical Frequency')
title('Ddownsampled Fourier Transform');
