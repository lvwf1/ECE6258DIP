%(a)
figure;
grey_img=imread('lena_grey.png');

%(b)
imshow(grey_img);
title('(b).Original');
dou_img=double(grey_img);

%(c)
energy_img = norm(dou_img,'fro');

%(d)
figure;
fun = @(block_struct) dct2(block_struct.data);
dct_img = blockproc(dou_img,[8 8],fun);
imshow(dct_img);
title('(d).2D-DCT');

%(e)
figure;
ifun = @(block_struct) idct2(block_struct.data);
idct_img = blockproc(dct_img,[8 8],ifun);
imshow(uint8(idct_img));
title('(e).Reconstructed image');

%(f)
energy_inv_img = norm(idct_img,'fro');

%(g)
figure;
error_img = dou_img - idct_img;
imagesc(error_img);
title('(g).Error image');

%(h)
figure;
hdct_img = blockproc(dou_img,[8 8],fun);
zzfun_15 = @(block_struct) ZigZagscan(block_struct.data,15);
zzh_img = blockproc(hdct_img,[8 8],zzfun_15);
rech_img = blockproc(zzh_img,[8 8],ifun);
imshow(uint8(rech_img));
title('(h).Reconstructed image for only the first 15 coefficients');

%(i)
energy_i_img = norm(rech_img,'fro');

%(j)
figure;
jdct_img = blockproc(dou_img,[8 8],fun);
zzfun_6 = @(block_struct) ZigZagscan(block_struct.data,6);
zzj_img = blockproc(jdct_img,[8 8],zzfun_6);
recj_img = blockproc(zzj_img,[8 8],ifun);
imshow(uint8(recj_img));
title('(h).Reconstructed image for only the first 6 coefficients');

%(k)
energy_k_img = norm(recj_img,'fro');

%(l)
figure;
for N = 1:1:64
ldct_img = blockproc(dou_img,[8 8],fun);
zzfun = @(block_struct) ZigZagscan(block_struct.data,N);
zz_img = blockproc(ldct_img,[8 8],zzfun);
lidct_img = blockproc(zz_img,[8 8],ifun);
energy = norm(lidct_img,'fro');
hold on;
stem(N,energy);
title('(l).Reconstructed image versus the number of DCT coefficients');
end