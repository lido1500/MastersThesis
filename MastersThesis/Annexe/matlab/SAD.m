function [ sadObject ] = SAD
% SAD Creates a SAD correlation object.
%
%	The SAD correlation object encapsulates the information 
%	related to using the SAD. Where fun is a pointer to the
%	function, optimisation is the optimisation function in 
%	in this case, we want to minimize. And perfectCorrelation
%	indicates the value returned by fun when the correlation
%	is perfect.
%
% By Luc Trudeau, 25 August 2010.
    sadObject.fun = @calcSAD;
    sadObject.optimisation = @(x, y) x <= y;
    sadObject.perfectCorrelation = 0;

end
