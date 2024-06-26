close all;
clear;
clc;

re_path = 'images/re'; 
le_path = 'images/le';
nose_path = 'images/ne'; 
mouth_path = 'images/mouth'; 
fname = 'images/test/front_test.jpg';

img = imread(fname);

[rightEyeImg, rightEyeFilter] = convImgFilter(fname,re_path,0.2,1);
[leftEyeImg, leftEyeFilter] = convImgFilter(fname,le_path,0.2,1);
[noseImg, noseFilter] = convImgFilter(fname,nose_path,0.17,2);
[mouthImg, mouthFilter] = convImgFilter(fname,mouth_path,0.15,3);

Red = [255, 0, 0];
Green = [0, 255, 0];
Blue = [0, 0, 255];

% 잘못 찾아서 사진 밖으로 박스를 그리는 경우 이미지 크기가 달라져서
% 일단 눈코입 따로따로 박스를 그렸습니다.(예외처리보다 간단해서)

imgEye = drawResult(img,rightEyeImg,rightEyeFilter,Red);
imgEye = drawResult(imgEye,leftEyeImg,leftEyeFilter,Red);
imgNose = drawResult(img,noseImg,noseFilter,Green);
imgMouth = drawResult(img,mouthImg,mouthFilter,Blue);


figure;
imshow([uint8(imgEye),uint8(imgNose),uint8(imgMouth)]);

figure;
imshow([rightEyeImg,leftEyeImg,noseImg,mouthImg]);
