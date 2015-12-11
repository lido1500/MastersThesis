function [ tempBlockiness, diffTop, diffRight, diffBottom, diffLeft] = temporalBlockiness( mVs, prev, bad, blockSize)
%TEMPORALBLOCKINESS measure de difference of blockiness between all the
%blocs in the frame and the blockiness of blocs candidate defined by there
%motion vectors.
%
%   [ tempBlockiness, diffTop, diffRight, diffBottom, diffLeft] =
%   temporalBlockiness( mVs, prev, bad, blockSize) returns the temporal
%   blockiness of each bloc in the frame. Difftop, diffRight, diffBottom
%   and diffLeft are the blockiness of each border of all blocks.
%
%
% By Luc Trudeau.
[class2, class3, class4] = interpolateClasses(prev);
[height width, z] = size(mVs);
diffTop = zeros(height, width);
diffRight = zeros(height, width);
diffBottom = zeros(height, width);
diffLeft = zeros(height, width);

for yy = 1: height
    y = (yy-1) * blockSize + 1;
    for xx = 1: width
        x = (xx-1) * blockSize + 1;
        
        vY = mVs(yy,xx,1);
        vX = mVs(yy,xx,2);
        
        if floor(vY) ~= vY && floor(vX) ~= vX
            pY = y + floor(vY);
            pX = x + floor(vX);
            class = class4;
        elseif floor(vY) ~= vY
            pY = y + floor(vY);
            pX = x + vX;
            class = class3;
        elseif floor(vX) ~= vX
            pY = y + vY;
            pX = x + floor(vX);
            class = class2;
        else
            pY = y + vY;
            pX = x + vX;
            class = prev;
        end
        
        [ top, right, bottom, left ] = blockiness( y, x, bad, blockSize);
        
        [ prevTop, prevRight, prevBottom, prevLeft ] = blockiness( ...
            pY, pX, class, blockSize);
        
        if yy > 1
            diffTop(yy,xx) = sum(abs(top - prevTop));
        else
            diffTop(yy,xx) = 0;
        end
        
        if xx < width 
            diffRight(yy,xx) = sum(abs(right - prevRight));
        else
            diffRight(yy,xx) = 0;
        end
        
        if yy < height
            diffBottom(yy,xx) = sum(abs(bottom - prevBottom));
        else
            diffBottom(yy,xx) = 0;
        end
        
        if xx > 1
            diffLeft(yy,xx) = sum(abs(left - prevLeft));
        else
            diffLeft(yy,xx) = 0;
        end
    end
end

tempBlockiness = diffTop + diffRight + diffBottom + diffLeft;
end

