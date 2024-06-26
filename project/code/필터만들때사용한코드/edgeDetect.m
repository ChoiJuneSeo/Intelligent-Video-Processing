
clear;
clc;

fname ="images/face/3.jpg";
fname2 ="dad.jpg";

image = imread(fname);
grayImage = rgb2gray(image);
edge_img = edge(grayImage, 'Canny',0.1,1);

figure(1);
imshow(edge_img);

imwrite(edge_img,'1_1.jpg');

