function [maxval, r, c] = max2d(img)


[~, col] = size(img);

img = img';
vec = img(:);

[maxval, ind] = max(vec);

r = floor((ind-1)/col);
c = (ind-1) - r*col;

r = r+1;
c = c+1;
end