% Lab 02 :
% Test_ alpha blending

clear;
clc;

imgA = imread("baboon.png");
imgB = imread("lena.png");

% alp = 0:0.1:1;
% for i=1:length(alp)
%     ap = alp(i);
%     img = (1-ap)*imgA + ap*imgB;
% 
%     figure(i);
%     imshow(img);
%     %pause(1);
% end

[row,col,dep] = size(imgA);
msksize = [row,col];
rad = min(msksize)/3;
imMsk = CircleMask(msksize, rad);
figure;
imshow(imMsk);

h = [1 2 3 4 5 4 3 2 1];
h = conv(h,h);
hh = h'*h;
hh = hh/sum(hh(:));
imMsk = double(imMsk);
imMsk = imfilter(imMsk, hh);
figure;
imshow(imMsk);

% sig = min(msksize)/6;
% imMsk = GaussMask(msksize, sig);
% figure;
% imshow(imMsk);
% image composition
imgA = double(imgA);
imgB = double(imgB);
imgMsk = double(repmat(imMsk, [1,1,3]));

imgR = imgA.*imgMsk + imgB.*(1-imgMsk);

figure;
imshow(imgR/255);