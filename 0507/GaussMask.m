function imMsk = GaussMask(msksize, sig)
% imMsk = GaussMask(msksize, sig)
% msksize = [row, col] of size of mask
% sig : sigma for gaussian function

rows = msksize(1);
cols = msksize(2);
center = msksize/2;

% Meshgrid
[x, y] = meshgrid(1:rows, 1:cols);

% Distance
% exp(- (x^2 + y^2)/2*sigma^2 )
dist = exp( -((x-center(2)).^2 + (y-center(1)).^2)/(2*sig^2) );

% Gaussian mask
imMsk = dist/max(dist(:));

end