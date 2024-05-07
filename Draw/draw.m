% draw
clear;
clc;

% image loading
fhead = 'lena';
fext = 'png';
filename = sprintf('%s.%s',fhead,fext);
img = imread(filename);



% 
leftTop = [100,100];
rightBottom = [200,200];
color = [255,255,255];
center = [100,100];
size = 30;
radius =70;
p1 = [20,100];
p2 = [200,100];


imgBox = imDrawBox(img,leftTop,rightBottom,color);
imgCross = imDrawCross(img,center,size,color);
imgCircle = imDrawCircle(img,center,radius,color);
imLine = imDrawLine(img,p1,p2,color);

figure(1);
imshow([imgBox,imgCross,imgCircle,imLine]);

lineInfo = [1,1,30,60];
point = pntLine(lineInfo);
imLine2 = imDrawPoints(img,point,color);

figure(2);
imshow(imLine2);
