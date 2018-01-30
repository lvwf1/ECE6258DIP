%% Load Frames
clear all; clc; close all;
addpath('./flow-code-matlab/');
ImagesFolders={'Drop/';'GrassSky/';'RubberWhale/';'Urban/'};
ImagesFolders = strcat('./images/',ImagesFolders);

figure(1);
hold on;
figure(2);
hold on;
figure(3);
hold on;
for ti=1:4
TestImageID = ti;% 1 = Drop;2 = GrassSky; 3 = RubberWhale; 4 = Urban

frame1 = imread([ImagesFolders{TestImageID},'frame1.png']);
frame2 = imread([ImagesFolders{TestImageID},'frame2.png']);
residual = abs(frame1-frame2);
PSNR_val = psnr(rgb2gray(frame1),rgb2gray(frame2));

frame1 = im2double(rgb2gray(frame1));
frame2 = im2double(rgb2gray(frame2));

iteration_number = [100, 300, 500, 3000, 5000];
wws = [5, 13, 30, 50, 100];

for k=1:5
    iterations=iteration_number(k);
    ww = wws(k);
    tic
    % Gradients (partial derivatives) are calculated here
    dIx = conv2(frame1, [-1 1;-1 1], 'same'); % partial on x (a)(i)
    dIy = conv2(frame1, [-1 1; 1 1], 'same'); % partial on y (a)(ii)
    dIt = conv2(frame1, [1 1; 1 1], 'same')+conv2(frame2, [-1 -1; -1 -1], 'same'); % partial on t (a)(iii)

    u = zeros(size(frame1));
    v = zeros(size(frame1));

    OF_alg = 1;%Horn-Schuck = 0, Lucas-Kanade = 1
    switch OF_alg
        case 0
            % Horn-Schuck Optical Flow
            fprintf('The optical flow is estimated using Horn-Schuck...\n');
            HS_OF;
        case 1
            % Lucas-Kanade Optical Flow
            fprintf('The optical flow is estimated using Lucas-Kanade...\n');
            LK_OF;
        otherwise
            error('Please choose OF calculation method by setting OF_alg to 0 for Horn-Schuck, or 1 for Lucas-Kanade.');
    end
    ck0 = toc;
    ck = [floor(ck0/60), rem(ck0,60)];
    timestamp = sprintf('%d minutes and %0.5f seconds',ck);
    fprintf('Flow estimation time was %s.\n\n',timestamp);
    time_insecs(k) = ck0;

%downsampling variables for visualization and plotting
SkipSize1 = 10;
[m, n] = size(frame1);
[X,Y] = meshgrid(1:n, 1:m);

% downsample u and v
u_ds = u(1:SkipSize1:end, 1:SkipSize1:end);
v_ds = v(1:SkipSize1:end, 1:SkipSize1:end);

% Coordinate for downsampled u and v in frame
X_ds = X(1:SkipSize1:end, 1:SkipSize1:end);
Y_ds = Y(1:SkipSize1:end, 1:SkipSize1:end);

%Read and plot ground-truth flow
GroundTruthFlow = readFlowFile([ImagesFolders{TestImageID},'flow1_2.flo']);
u_gt = GroundTruthFlow(:,:,1);
v_gt = GroundTruthFlow(:,:,2);
% downsample u_gt and v_gt
u_gt_ds = u_gt(1:SkipSize1:end, 1:SkipSize1:end);
v_gt_ds = v_gt(1:SkipSize1:end, 1:SkipSize1:end);

% Normalization for consistent error calculation - Don't worry about this
un = mat2gray(u);
un_gt = mat2gray(u_gt);
vn = mat2gray(v);
vn_gt = mat2gray(v_gt);

% Error calculation and print
EPE = sqrt((un-un_gt).^2+(vn-vn_gt).^2);
AE = acos((un.*un_gt+vn.*vn_gt+1)./(sqrt(un+vn+1).*sqrt(un_gt+vn_gt+1)));
fprintf('\nError nan ratio: EPE = %f, AE = %f\n',sum(isnan(EPE(:)))/numel(EPE),sum(isnan(AE(:)))/numel(AE));
fprintf('Error inf ratio: EPE = %f, AE = %f\n',sum(isinf(EPE(:)))/numel(EPE),sum(isinf(AE(:)))/numel(AE));

EPE_avg(k) = mean2(EPE(~isnan(EPE)));
AE_avg(k) = mean2(AE(~isnan(AE)));

fprintf('\nEPE = %f, AE = %f\n',EPE_avg,AE_avg);
end

% %(b)(iii)
% figure(1);
% plot(iteration_number,time_insecs);
% xlabel('Iteration Number');
% ylabel('Execution Time in Seconds');
% legend({'Drop', 'GrassSky', 'RubberWhale', 'Urban'});
% 
% %(b)(iv)
% figure(2);
% plot(iteration_number, EPE_avg);
% xlabel('Iteration Number');
% ylabel('EPE_avg');
% legend({'Drop', 'GrassSky', 'RubberWhale', 'Urban'});
% 
% figure(3);
% plot(iteration_number, AE_avg);
% xlabel('Iteration Number');
% ylabel('AE_avg');
% legend({'Drop', 'GrassSky', 'RubberWhale', 'Urban'});

%(c)(iii)
figure(1);
plot(wws,time_insecs);
xlabel('wws');
ylabel('Execution Time in Seconds');
legend({'Drop', 'GrassSky', 'RubberWhale', 'Urban'});

%(c)(iv)
figure(2);
plot(wws, EPE_avg);
xlabel('wws');
ylabel('EPE_avg');
legend({'Drop', 'GrassSky', 'RubberWhale', 'Urban'});

figure(3);
plot(wws, AE_avg);
xlabel('wws');
ylabel('AE_avg');
legend({'Drop', 'GrassSky', 'RubberWhale', 'Urban'});
end