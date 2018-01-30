% ECE 6258: Digital Image Processing
% School of Electrical and Computer Engineering
% Georgia Institute of Technology
% Prof. Ghassan Alregib
% Last updated on 10/15/2017 by Motaz Alfarraj (motaz@gatech.edu)

%% Initialization  
clc
clear all
close all
 
%% Read the image and add noise  

f = ;  % <- Read the image here 
f = double(f); 
% Add noise 
sig_noise = 0; % this is the variable sigma for the nosie  
g = f + sig_noise*randn(size(f));

%% -----------------Gaussian Filter--------------------------------------
L = ; % <-- Choose a value of L. Filter size = [2L+1 x 2L+1]  
sig = ; %<-- Choose sigma for the filter 

g_pad = ; %<-- Pad g with L pixels from each direction using symmetric extension 

% Create your filter of size [2L+1 x 2L+1]  
h1 = ;


% You don't need to edit this part. It will do the filtering
h1 = h1/sum(h1(:));
for i=1:size(g,1)
    for j=1:size(g,2)
        
        Block = g_pad(i:i+2*L,j:j+2*L);
        f1(i,j)= sum(sum(Block.*h1));
    
    end
end

%% -----------------Sigma Filter--------------------------------------
L = ; % <-- Choose a value of L. Filter size = [2L+1 x 2L+1]  
rho = ; %<-- Choose rho for the filter 

g_pad = ; %<-- Pad g with L pixels from each direction using symmetric extension 

for i=1:size(g,1)
    for j=1:size(g,2)
        Block=g_pad(i:i+2*L,j:j+2*L);
        h2 = ; %<-- construct the sigma filter here. 
       
        h2 = h2/sum(h2(:));  
        f2(i,j)=sum(sum(Block.*h2));    
    end
end


%% ----------------Bilateral Filter---------------------------------------
L = ; % <-- Choose a value of L. Filter size = [2L+1 x 2L+1]  
sig = ; %<-- Choose sigma for the filter 
rho = ; %<-- Choose rho for the filter 

g_pad = ; %<-- Pad g with L pixels from each direction using symmetric extension 

for i=1:size(f,1)
    for j=1:size(f,2)
        Block=g_pad(i:i+2*L,j:j+2*L); 
        
        h3 = ; %<-- construct the bilateral filter here. 
        
        
        h3 = h3/sum(h3(:)); 
        f3(i,j)=sum(sum(Block.*h3)); 
    end
end


%% MSE computation 
% compute MSE for f1, f2, and f3 with repsect to f
MSE1 = 
MSE2 = 
MSE3 = 

fprintf('MSE using Gaussin filter = %0.4f\n',MSE1); 
fprintf('MSE using Gaussin filter = %0.4f\n',MSE2); 
fprintf('MSE using Gaussin filter = %0.4f\n',MSE3); 

%% Show the images 

 
subplot(231)
imshow(f,[])
title('Original')

subplot(233)
imshow(g,[])
title('Noisy')

subplot(234)
imshow(f1,[])
title('Gaussian Filter')

subplot(235)
imshow(f2,[])
title('Sigma Filter')

subplot(236)
imshow(f3,[])
title('Bilateral Filter')
