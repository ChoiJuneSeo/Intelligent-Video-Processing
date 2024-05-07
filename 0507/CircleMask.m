function imMsk = CircleMask(msksize, rad)
% imMsk = CircleMask(msksize, rad)
% msksize = [row, col] of size of mask
% rad : radius for circle

rows = msksize(1);
cols = msksize(2);
center = msksize/2;

% Meshgrid
[x, y] = meshgrid(1:rows, 1:cols);

% Distance
dist = sqrt( (x-center(2)).^2 + (y-center(1)).^2 );

% Binary mask
imMsk = dist <= rad;

end