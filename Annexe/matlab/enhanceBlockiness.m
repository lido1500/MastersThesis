function [ blocks ] = enhanceBlockiness( tops, rights, bottoms, lefts, threshold )
%ENHANCEBLOCKINESS Distributes a blocky border to the most blocky block.
% 
%   [ blocks ] = enhanceBlockiness( tops, rights, bottoms, lefts, threshold
%   ) returns the distributed blockiness values of the blocks of a frame.
%
% By Luc Trudeau.
if nargin == 4;
    threshold = 0;
end

blocks = tops + rights + bottoms + lefts;
[height width z] = size(blocks);
map = true(height, width);
maxBlock = max(blocks(:));

while maxBlock > threshold;
    
    availableBlocks = blocks .* map;
    maxBlock = max(availableBlocks(:));
    [yPos, xPos] = find(availableBlocks == maxBlock,1);
    map(yPos, xPos) = 0;
    
    %Check top
    if yPos > 1
        if tops(yPos, xPos) > 0 && bottoms(yPos-1, xPos) > 0
            if blocks(yPos-1,xPos) > blocks(yPos, xPos)
                tops(yPos, xPos) = 0;
            else
                bottoms(yPos-1, xPos) = 0;
            end
        end
    end
    
    %Check left
    if xPos > 1
        if lefts(yPos, xPos) > 0 && rights(yPos, xPos-1) > 0
            if blocks(yPos,xPos-1) > blocks(yPos, xPos)
                lefts(yPos, xPos) = 0;
            else
                rights(yPos, xPos-1) = 0;
            end
        end
    end
    
    %Check bottom
    if yPos < height
        if bottoms(yPos, xPos) > 0 && tops(yPos+1, xPos) > 0
            if blocks(yPos+1,xPos) > blocks(yPos, xPos)
                bottoms(yPos, xPos) = 0;
            else
                tops(yPos+1, xPos) = 0;
            end
        end
    end
    
    %Check right
    if xPos < width
        if rights(yPos, xPos) > 0 && lefts(yPos, xPos+1)
            if blocks(yPos,xPos+1) > blocks(yPos, xPos)
                rights(yPos, xPos) = 0;
            else
                lefts(yPos, xPos+1) = 0;
            end
        end
    end
    
    blocks = tops + bottoms + lefts + rights;
end
end