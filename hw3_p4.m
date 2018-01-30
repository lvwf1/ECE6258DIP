%(a)airplane_downsampled_square.jpg
f = imread('airplane_downsampled_square.jpg');
f=double(f);

figure;
output1 = KLT_columns(f,5);
subplot(3,2,1);
imagesc(output1);
colormap gray;
title('Reconstructed Images KLT Base=5');
re1=output1-f;
subplot(3,2,2);
imagesc(re1);
colormap gray;
title('Residual Error KLT Base=5');

output2 = KLT_columns(f,25);
subplot(3,2,3);
imagesc(output2);
colormap gray;
title('Reconstructed Images KLT Base=25');
re2=output2-f;
subplot(3,2,4);
imagesc(re2);
colormap gray;
title('Residual Error KLT Base=25');

output3 = KLT_columns(f,50);
subplot(3,2,5);
imagesc(output3);
colormap gray;
title('Reconstructed Images KLT Base=50');
re3=output3-f;
subplot(3,2,6);
imagesc(re3);
colormap gray;
title('Residual Error KLT Base=50');

%(b)airplane_downsampled_square.jpg
figure;
for k =1:200
    output4=KLT_columns(f,k);
    ri(k)=immse(output4, f);;
end
plot(ri);
title('Airplane mean squared error (MSE) of the reconstructed image')

%(a)Brussels_downsampled_square.jpg
f = imread('Brussels_downsampled_square.jpg');
f=double(f);

figure;
output1 = KLT_columns(f,5);
subplot(3,2,1);
imagesc(output1);
colormap gray;
title('Reconstructed Images KLT Base=5');
re1=output1-f;
subplot(3,2,2);
imagesc(re1);
colormap gray;
title('Residual Error KLT Base=5');

output2 = KLT_columns(f,25);
subplot(3,2,3);
imagesc(output2);
colormap gray;
title('Reconstructed Images KLT Base=25');
re2=output2-f;
subplot(3,2,4);
imagesc(re2);
colormap gray;
title('Residual Error KLT Base=25');

output3 = KLT_columns(f,50);
subplot(3,2,5);
imagesc(output3);
colormap gray;
title('Reconstructed Images KLT Base=50');
re3=output3-f;
subplot(3,2,6);
imagesc(re3);
colormap gray;
title('Residual Error KLT Base=50');

%(b)Brussels_downsampled_square.jpg
figure;
for k =1:200
    output4=KLT_columns(f,k);
    ri(k)=immse(output4, f);;
end
plot(ri);
title('Brussels mean squared error (MSE) of the reconstructed image')

%KLT_columns function
function recon=KLT_columns(X,k)

U = mean(X);
U = double(U);
N = size(X,1);
Rff=((X-U)*(X-U)')/N;
[B,S,V]=svd(Rff);

O=B(:,1:k);
recon=O*O'*(X-U)+U;
end