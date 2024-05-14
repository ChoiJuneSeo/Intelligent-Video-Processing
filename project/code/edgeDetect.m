
clear;
clc;

fname ="45_2.jpg";
sigma = 2;
image = imread(fname);
grayImage = rgb2gray(image);
smoothedImage = imgaussfilt(grayImage, sigma); % sigma는 로우패스 필터의 표준편차입니다.
edge_img = edge(grayImage, 'Canny',0.1,1);

figure(1);
imshow(edge_img);

imwrite(edge_img,'edge45_2.jpg');

