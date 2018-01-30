figure;
cnt = 1;
for i = [100, 140, 180, 220] %[140, 160, 180, 200]
    for j = 2:2:24 %1:12
        subplot(4,12,cnt);
        cnt = cnt + 1;
        img = ones(400, 400)*i;
        img(100:300,100:300)=i-j;
        img = uint8(img);
        imshow(img);
        title(['k=' num2str(roundn(j/i,-3))]);
    end
end
