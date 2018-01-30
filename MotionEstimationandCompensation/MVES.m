
%ECE6258: Digital image processing 
%Prof. Ghassan Alregib 
%School of Electrical and Computer Engineering 
%Georgia Instiute of Technology 
%Date Modified : 10/23/2016 by Motaz Alfarraj (motaz@gatech.edu)  
%This code computes the motion vectors 

function [MVs_y, MVs_x] = MVES(imgP, imgI, MB_Size, p)
[fheight, fwidth] = size(imgI);
MVs_y = zeros(fheight/MB_Size,fwidth/MB_Size);
MVs_x = zeros(fheight/MB_Size,fwidth/MB_Size);

% Starting from the top left of the image
% For every MB in imgP, we look for the closest match in the imgI in an area
% surrounding the location of the MB. The search is done in an area that includes p pixels 
% on the left, right, top and bottom of the MB.

for ii = 1 : MB_Size : fheight-MB_Size+1
    for jj = 1 : MB_Size : fwidth-MB_Size+1
        
        % Estimate cost for  (2p + 1)^2 blocks 
        % m is row (vertical) index
        % n is column (horizontal) index
        err_min = inf;
        for m = -p : p        
            for n = -p : p
                refBlk_y = ii + m;   % row (vertical) coordinate for reference block
                refBlk_x = jj + n;   % column (horizontal) coordinate for reference block
                if ( refBlk_y < 1 || refBlk_y+MB_Size-1 > fheight ...
                     || refBlk_x < 1 || refBlk_x+MB_Size-1 > fwidth)
                    continue;
                end
                
                % EDIT THIS PART
                % Computes the Mean Absolute Difference (MAD) for the given two blocks
                %%%%%%%%%%%%%%% Part (a.i) %%%%%%%%%%%%%%%%%%%
                MAD = mean2(abs(imgP(ii:ii+MB_Size-1,jj:jj+MB_Size-1) - imgI(refBlk_y:refBlk_y+MB_Size-1,refBlk_x:refBlk_x+MB_Size-1)));
                
                % EDIT THIS PART
                % Check whether the current err value is less then the already present value in err_min
                % If so, swap the err_min value with the current one and note
                % the indices.                 
                %%%%%%%%%%%%%%% Part (a.ii) %%%%%%%%%%%%%%%%%%%
                if(MAD < err_min)
                    err_min = MAD;
                    dy = m;
                    dx = n;
                end
            end
        end
        
        MVs_y(floor(ii/MB_Size)+1,floor(jj/MB_Size)+1) = dy;    % row (vertical) coordinate for the vector
        MVs_x(floor(ii/MB_Size)+1,floor(jj/MB_Size)+1) = dx;    % col (horizontal) coordinate for the vector
    end
end