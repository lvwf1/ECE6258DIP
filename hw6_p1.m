Ir=[1 3 5 8;7 6 4 2;2 1 6 3;9 4 1 5];
Id=[2 3 6 9;5 6 4 3;2 2 6 4;8 4 2 5];
mse = calculateMSE(Ir,Id);
psnr = calculatePSNR(Ir,Id);
ssim = ssim(Ir,Id);

function mse=calculateMSE(Ir,Id)
[m,n]=size(Ir);
temp=0;
for i=1:m
    for j=1:n
        diff=Ir(i,j)-Id(i,j);
        temp=temp+abs(diff)^2;
    end
end
mse=temp/(m*n);
end

function psnr=calculatePSNR(Ir,Id)
psnr=20*log10(max(Ir(:))/sqrt(calculateMSE(Ir,Id)));
end
