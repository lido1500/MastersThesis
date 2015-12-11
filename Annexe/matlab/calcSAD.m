function [ result ] = calcSAD( A, B )
%CALCSAD Sum of absolute differences
%
%   result = calcSAD( A, B ) returns the sum of the absolute difference between
%   each value in the matrix A and the corresponding value in the matrix B.
%   These differences are summed to create a simple metric of block 
%   similarity, the L1 norm of the difference image.
%
% By Luc Trudeau, 25 August 2010.

diff = imabsdiff(A, B);
result = sum(diff(:));

end

