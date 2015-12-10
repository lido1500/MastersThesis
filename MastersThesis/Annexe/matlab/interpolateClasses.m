function [ class2, class3, class4 ] = interpolateClasses( image )
%INTERPOLATECLASSES returns the 3 interpolation classes of an image for
%half pixel precision.
%
%   [ class2, class3, class4 ] = interpolateClasses( image ) returns 3
%   images that are interpolations of the pixels between the pixels of
%   image. This allows for half pixel precision.
%
% By Luc Trudeau.
hImage = image / 2;
qImage = image / 4;
[height width z] = size(image);

class2 = hImage(:, 1:end-1,:) + hImage(:, 2:end,:);
class2 = [class2, image(:,end, :)];
class3 = hImage(1:end-1, :,:) + hImage(2:end, :,:);
class3 = [class3; image(end,:, :)];

class4 = zeros(height, width, z);

for y = 1: height
    bottom = min(y + 1, height);
    for x = 1: width
        right = min(x + 1, width);
        class4(y,x, :) = qImage(y,x, :) + qImage(bottom,x, :) + ...
            qImage(y,right, :) + qImage(bottom,right, :);
    end
end
