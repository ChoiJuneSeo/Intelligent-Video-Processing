% image Lab 04 : Demosaicking ( CFA interpolation )
% CFA - RG RG RG
%       GB GB GB
clear;
clc;

% image loading
fhead = 'lena';
fext = 'png';
filename = sprintf('%s.%s',fhead,fext);
img = imread(filename);

filename = sprintf('%s_cfa.%s',fhead,fext);
cfa = imread(filename);
figure(1);
imshow(cfa);

% Split cfa into each spectrum
[cfaR, cfaG, cfaB] = CFASplit(cfa);
figure(2);
imshow([cfaR, cfaG, cfaB]);

% Linear Image Interpolation for R/G/B componants
imgR = CFAInterpolationR(cfaR);
imgG = CFAInterpolationG(cfaG);
imgB = CFAInterpolationB(cfaB);

figure(3);
imshow([imgR,imgG,imgB]);

% Comparison
imgRe = 0*img;
imgRe(:,:,1) = imgR;
imgRe(:,:,2) = imgG;
imgRe(:,:,3) = imgB;

figure(4);
imshow([img,imgRe]);

% PSNR or SSIM
cutsize = [2,2];

imgRe = CutBoundary(imgRe,cutsize);
img = CutBoundary(img,cutsize);

pval = psnr(imgRe,img,255);
sval = ssim(imgRe,img);
txt = sprintf('PSNR = %4.2fdB, SSIM = %4.3f',pval,sval);
disp(txt);





