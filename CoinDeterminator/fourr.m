namespre = ['O', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
ext = '.png';


for ndx = namespre
    name = sprintf('%s%s', ndx, ext);
    vec = imread(name);
    vec = rgb2gray(vec);
    vec = double(vec);
    
    figure()
    subplot(1,2,1)
    imshow(vec, [])
    subplot(1,2,2)
    imagesc(fftshift(log(abs(fft2(vec)))));
end
