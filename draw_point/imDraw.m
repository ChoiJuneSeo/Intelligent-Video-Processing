% lab 05 : drawing
clear;
clc;

fhead = 'lena';
fext = 'png';
filename = sprintf('%s.%s',fhead,fext);

img = imread(filename);
jpginf = imfinfo(filename);
filesize = jpginf.FileSize;
[row, col, dep] = size(img);

imgR = double(img(:,:,1));
imgG = double(img(:,:,2));
imgB = double(img(:,:,3));
imgY = (imgR + imgG + imgB)/3;

pnt = [250,250];
color = [255,255,255];
imgout = imDrawPoint(img,pnt,color);

figure(1);
imshow(imgout);

for n=1:50
    pnt(n,1) = 100+n;
    pnt(n,2) = 100;
end

imgout = imDrawPoints(img,pnt,color);
figure(2);
imshow(imgout);

