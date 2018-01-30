CIR = multibandread('paris.lan', [512, 512, 7], 'uint8=>uint8',...
                    128, 'bil', 'ieee-le', {'Band','Direct',[4 3 2]});
figure
imshow(CIR)
title('CIR Composite (Un-enhanced)')
text(size(CIR,2), size(CIR,1) + 15,...
  'Image courtesy of Space Imaging, LLC',...
  'FontSize', 7, 'HorizontalAlignment', 'right')
decorrCIR = decorrstretch(CIR, 'Tol', 0.01);
figure
imshow(decorrCIR)
title('CIR Composite with Decorrelation Stretch')
NIR = im2single(CIR(:,:,1));
red = im2single(CIR(:,:,2));
figure
imshow(red)
title('Visible Red Band')
figure
imshow(NIR)
title('Near Infrared Band')
figure
plot(red, NIR, '+b')
ax = gca;
ax.XLim  = [0 1];
ax.XTick = 0:0.2:1;
ax.YLim  =  [0 1];
ax.YTick = 0:0.2:1;
axis square
xlabel('red level')
ylabel('NIR level')
title('NIR vs. Red Scatter Plot')
ndvi = (NIR - red) ./ (NIR + red);
figure
imshow(ndvi,'DisplayRange',[-1 1])
title('Normalized Difference Vegetation Index')
threshold = 0.4;
q = (ndvi > threshold);
100 * numel(NIR(q(:))) / numel(NIR)
figure
imshow(q)
title('NDVI with Threshold Applied')