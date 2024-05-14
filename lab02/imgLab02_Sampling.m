% image Lab 02 : image sampling
clear;
clc;

% image loading
fhead = '1';
fext = 'jpg';
filename = sprintf('%s.%s',fhead,fext);

img = imread(filename);
jpginf = imfinfo(filename);
filesize = jpginf.FileSize;
[row, col, dep] = size(img);

% disp(filesize);

% image display
figure(1);
imshow(img);

% image down/up sampling
% down parameters

pitch = [3,3];
phpit = [0,0];

% imgD = img(1:2:end,1:2:end,:);
% imgD = img(phpit(1)+1:pitch(1):end,phpit(2)+1:pitch(2):end,:);
imgD = SamplingDown(img,pitch,phpit);
imwrite(imgD,'down.jpg');
figure(2);
imshow(imgD);

% up sampling

% [row,col,dep] = size(imgD);
% imgU = uint8(zeros(row*pitch(1),col*pitch(2),dep));
% imgU(phpit(1)+1:pitch(1):end,phpit(2)+1:pitch(2):end,:) = imgD;

imgU = SamplingUp(imgD,pitch,phpit);


figure(3);
imshow(imgU);

filenameout = sprintf('%s_up.%s',fhead,fext);
imwrite(imgU,filenameout);



