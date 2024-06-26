close all;
clear;
clc;

eye_path = 'images/sideEye';
nose_path = 'images/sn'; 
mouth_path = 'images/sm'; 

fname = 'images/test/side_test.jpg';
img = imread(fname);

[EyeImg, EyeFilter] = convImgFilter(fname,eye_path,0.2,1);
[noseImg, noseFilter] = convImgFilter(fname,nose_path,0.17,2);
[mouthImg, mouthFilter] = convImgFilter(fname,mouth_path,0.15,3);


Red = [255, 0, 0];
Green = [0, 255, 0];
Blue = [0, 0, 255];

imgEye = drawResult(img,EyeImg,EyeFilter,Red);
imgNose = drawResult(img,noseImg,noseFilter,Green);
imgMouth = drawResult(img,mouthImg,mouthFilter,Blue);


figure;
imshow([EyeImg,noseImg,mouthImg]);

figure;
imshow([uint8(imgEye),uint8(imgNose),uint8(imgMouth)]);

