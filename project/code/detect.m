close all;
clear;
clc;

re_path = 'images/gray_eye/r'; 
le_path = 'images/gray_eye/l';
nose_path = 'images/gray_nose'; 
mouth_path = 'images/gray_mouth'; 

fname = 'images/test/front_test.jpg';
img = imread(fname);

[rightEyeImg, rightEyeFilter] = convImgFilter2(fname,re_path);
[leftEyeImg, leftEyeFilter] = convImgFilter2(fname,le_path);
[noseImg, noseFilter] = convImgFilter2(fname,nose_path);
[mouthImg, mouthFilter] = convImgFilter2(fname,mouth_path);

figure;
imshow([rightEyeImg,leftEyeImg,noseImg,mouthImg]);

Red = [255, 0, 0];
Green = [0, 255, 0];
Blue = [0, 0, 255];

imgEye = drawResult(img,rightEyeImg,rightEyeFilter,Red);
imgEye = drawResult(imgEye,leftEyeImg,leftEyeFilter,Red);
imgNose = drawResult(img,noseImg,noseFilter,Green);
imgMouth = drawResult(img,mouthImg,mouthFilter,Blue);

figure;
imshow(uint8(imgEye));
figure;
imshow(uint8(imgNose));
figure;
imshow(uint8(imgMouth));


