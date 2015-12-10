function [results mvs] = blockMatching(prev, image, blockSize, searchRadius, searchFunction, correlationObject)
%BLOCKMATCHING matches the a block of the image with a block from the previous image.
%
%   [ result mvs ] = blockMatching( prev, image, blockSize, searchRadius, correlationFunction ) returns the
%   value of the correlation between the blocks of the frame and the best match in the previous image for
%   all blocks in the image based on the given blockSize.
%
% By Luc Trudeau, 25 August 2010.
[height width z] = size(image);
bHeight = height/blockSize;
bWidth = width/blockSize;

results = zeros(bHeight, bWidth);
mvs = zeros(bHeight, bWidth, 2);
bM1 = blockSize-1;

for y = 1 : blockSize : height
    yy = ceil(y/blockSize);
    yRange = y:y+bM1;
    searchTop = max(1, y-searchRadius);
    sTM1 = searchTop - 1;
    searchBottom = min(height, y+searchRadius);
    searchYRange = searchTop:searchBottom;
    for x = 1 : blockSize : width
        xx = ceil(x/blockSize);
        xRange = x:x+bM1;
        searchLeft = max(1, x-searchRadius);
        sLM1 = searchLeft - 1;
        searchRight = min(width, x+searchRadius);
        searchXRange = searchLeft:searchRight;
        
        block = image(yRange, xRange, :);
        searchArea = prev(searchYRange, searchXRange, :);
        
        [ results(yy,xx),  mV ] = searchFunction(searchArea, block, blockSize, correlationObject);
        mvs(yy, xx, :) = [ mV(1) - (y - sTM1), mV(2) - (x - sLM1) ];
    end
end

end