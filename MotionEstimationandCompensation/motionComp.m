%ECE6258: Digital image processing 
%Prof. Ghassan Alregib 
%School of Electrical and Computer Engineering 
%Georgia Instiute of Technology 
%Date Modified : 10/23/2016 by Motaz Alfarraj (motaz@gatech.edu)  
%This code Computes motion compensated image using the given motion vectors

function imgComp = motionComp(imgI, MVs_y, MVs_x, MB_Size)
[fheight, fwidth] = size(imgI);
% Start from the top left of the image
% For every MB we read the MV
% and put that MB from refernce image in the compensated image
imgComp = zeros(size(imgI));
for ii = 1:MB_Size:fheight-MB_Size+1
    for jj = 1:MB_Size:fwidth-MB_Size+1
        
        % dy is row (vertical) index
        % dx is column (horizontal) index
        dy = MVs_y(floor(ii/MB_Size)+1,floor(jj/MB_Size)+1);%%%%%%%%%%%%%%% Part (b.i) %%%%%%%%%%%%%%%%%%%
        dx = MVs_x(floor(ii/MB_Size)+1,floor(jj/MB_Size)+1);%%%%%%%%%%%%%%% Part (b.i) %%%%%%%%%%%%%%%%%%%;
        
        refBlk_y = ii+dy;%%%%%%%%%%%%%%% Part (b.ii) %%%%%%%%%%%%%%%%%%%;
        refBlk_x = jj+dx;%%%%%%%%%%%%%%% Part (b.ii) %%%%%%%%%%%%%%%%%%%;
        
        imgComp(ii:ii+MB_Size-1,jj:jj+MB_Size-1) = imgI(refBlk_y:refBlk_y+MB_Size-1,refBlk_x:refBlk_x+MB_Size-1);%%%%%%%%%%%%%%% Part (b.iii) %%%%%%%%%%%%%%%%%%%;
    end
end