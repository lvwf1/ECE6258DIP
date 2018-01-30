%ECE6258: Digital image processing 
%Prof. Ghassan Alregib 
%School of Electrical and Computer Engineering 
%Georgia Instiute of Technology 
%Date Modified : 10/23/2016 by Motaz Alfarraj (motaz@gatech.edu)  

%%
clc
close all
clear all

%% Set Path for  Linux/Mac
%SequencePath = '/home/workspace/Videos/YUV/';

%% Set Path for Windows
SequencePath = 'C:\Users\wlyu9\Videos\';

%% Two sequences to be processes. Uncomment one at a time 

SequenceName = 'mother-daughter_cif.yuv';
%SequenceName = 'mobile_cif.yuv';


%% Processing - DO NOT EDIT 

StartIndex = 1;
EndIndex = 10; % Total number of P-frames to be processed

fwidth = 352; fheight = 288; % CIF
% fwidth = 176; flength = 144; % QCIF

MB_Size = 16;
p = 7;

format = '420';
%set factor for UV-sampling
fw = 0.5;
fh= 0.5;
if strcmp(format,'400')
    fw = 0;
    fh = 0;
elseif strcmp(format,'411')
    fw = 0.25;
    fh = 1;
elseif strcmp(format,'420')
    fw = 0.5;
    fh = 0.5;
elseif strcmp(format,'422')
    fw = 0.5;
    fh = 1;
elseif strcmp(format,'444')
    fw = 1;
    fh = 1;
else
    display('Error: wrong format');
end

% Intialization
fprintf('Please wait... ');
fprintf('      ');
YUVFile = sprintf('%s%s', SequencePath,SequenceName);

shapes = vision.ShapeInserter;
shapes.Shape = 'Lines';
shapes.BorderColor = 'Custom'; 
shapes.CustomBorderColor = [255 0 0];

r = 1:MB_Size:fheight;
c = 1:MB_Size:fwidth;
[Y, X] = meshgrid(c,r);

VideoOut = vision.VideoPlayer;
VideoOut.Name  = 'Original Video/BW Video with MVs/Difference between Original and Motion Compensated';
VideoOut.Position = [100 500 3*fwidth+100 fheight+30];

% Set up for stream
nFrames = 2;
while (nFrames<EndIndex+1)     % Process for the first #EndIndex frames.
    pc = round(100*nFrames/(EndIndex-StartIndex+1));
    fprintf('\b\b\b\b\b\b%05.2f%%',pc);
    
    % Load I-frame and P-frame
    imgI = double(loadFileYUV(fwidth,fheight,nFrames-1,YUVFile,fh,fw));
    imgP = double(loadFileYUV(fwidth,fheight,nFrames,YUVFile,fh,fw));
    
    % Save Chrominance channels
    uvData = imgP(:,:,2:3);

    % Extracting only Luminance channels for motion analysis
    imgI = imgI(:,:,1);
    imgP = imgP(:,:,1);
    
    % Obtain Motion Vectors (MVs) via exhaustive search
    [V, H] = MVES(imgP, imgI, MB_Size, p);
    
    % Obtain motion compensated image
    imgComp = motionComp(imgI,V, H, MB_Size);

    % Reformat MVs into matrix form
%     H = reshape(motionVect(2,:),[fwidth/MB_Size fheight/MB_Size])'.*3;
%     V = reshape(motionVect(1,:),[fwidth/MB_Size fheight/MB_Size])'.*3;

    lines = [Y(:)'; X(:)'; Y(:)'+V(:)'*2; X(:)'+H(:)'*2];
    
    % Create RGB P-frame
    rgbP(:,:,1) = imgP./255;
    rgbP(:,:,2:3) = uvData./255;
    rgbP = ycbcr2rgb(rgbP);

    % Create a 3-channel for consistency
    imgMV(:,:,1) = imgP./255;
    imgMV(:,:,2) = imgP./255;
    imgMV(:,:,3) = imgP./255;
    
    % Draw MVs on image
    imgMV = step(shapes, imgMV,  lines');
    
    % Calculate difference between P-frame and motion compensated image
    Diff = abs(imgComp - imgP)./255;
    Diff(:,:,2) = Diff;
    Diff(:,:,3) = Diff(:,:,1);

    % Combined all frames next to each other for display 
    rgbDisp = [rgbP, ones(fheight,20,3), imgMV , ones(fheight,20,3), Diff];
    
    % Display video along with motion vectors.
    step(VideoOut, rgbDisp);

    % Increment frame count
    nFrames = nFrames + 1;
    
    % pause see changes
    % pause
end
% release(hVideoIn);
release(VideoOut);
fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b');
fprintf('Done!\n');