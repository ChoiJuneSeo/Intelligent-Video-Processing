% image loading
fhead = 'lena';
fext = 'jpg';
filename = sprintf('%s.%s',fhead,fext);

img = imread(filename);
jpginf = imfinfo(filename);
filesize = jpginf.FileSize;
[row, col, dep] = size(img);

% image display
figure(1);
imshow(img);
