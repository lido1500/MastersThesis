function [optResult, mv] = fullSearch(searchArea, block, blockSize, correlationObject)
% FULLSEARCH finds the best candidat for a block in a given search area.
%
% 	[minResult, mv] = matchBlock(searchArea, block, blockSize,
% 	correlationFunction) returns the best match obtained with the
% 	correlation function between the block and all possible blocks within the
% 	searchArea.
%
% By Luc Trudeau, 25 August 2010.

bM1 = blockSize -1;
[height width z] = size(searchArea);
mid = [ceil(height / 2), ceil(width / 2)];

% TODO The starting position could be optimized to the center of the search area.
mv = [1, 1];
optResult = correlationObject.fun(block, searchArea(1:1+bM1, 1:1+bM1, :));
for y = 1: height - bM1;
    yRange = y:y+bM1;
    for x = 1: width - bM1;
        xRange = x:x+bM1;
        result = correlationObject.fun(block, searchArea(yRange, xRange, :));
        
        if correlationObject.optimisation(result, optResult)
            newMV = [y x];
            if result == optResult
                if sum(abs(mv - mid) - abs(newMV - mid)) > 0
                    optResult = result;
                    mv = newMV;
                end
            else
                optResult = result;
                mv = newMV;
            end
        end
    end
end
end