function [ borderTop, borderRight, borderBottom, borderLeft ] =  blockiness(top, left, image, blockSize)
%BLOCKINESS measures de blockiness of bloc borders.
%
%   [ borderTop, borderRight, borderBottom, borderLeft ] =  blockiness(top,
%   left, image, blockSize) returns the difference of the pixels along the 
%   borders of a block.
%
% By Luc Trudeau.
bM1 = blockSize - 1;
[height width z] = size(image);
right = left + bM1;
bottom = top + bM1;

borderTop = zeros(1,blockSize,z);
borderRight = zeros(blockSize,1,z);
borderBottom = zeros(1,blockSize,z);
borderLeft = zeros(blockSize,1,z);

xRange = left:right;
yRange = top:bottom;

if top > 1
    borderTop = image(top-1, xRange, :) - image(top, xRange, :);
end

if left > 1
    borderLeft = image(yRange, left-1, :) - image(yRange, left, :);
end

if bottom < height
    borderBottom = image(bottom, xRange, :) - image(bottom+1, xRange, :);
end

if right < width
    borderRight = image(yRange, right, :) - image(yRange, right+1, :);
end

end