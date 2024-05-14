
clear;
clc;

fname ="edgeface2.jpg";
img2 = imread("face3_512.jpg");
patt1 = "edgeEye.jpg";
patt2 = "edgeNose.jpg";
patt3 = "edgeMouth.jpg";



img = imread(fname);
imgY = img;
% imgY = rgb2gray(img);
figure(1); imshow(imgY);
imgY = double(imgY);


eyeFilter = imread(patt1);
noseFilter = imread(patt2);
mouthFilter = imread(patt3);

eyeFilter = double(rgb2gray(eyeFilter));
noseFilter = double(rgb2gray(noseFilter));
mouthFilter = double(rgb2gray(mouthFilter));


eyeFilter = preConv(eyeFilter);
noseFilter = preConv(noseFilter);
mouthFilter = preConv(mouthFilter);
figure(4); imshow(uint8(noseFilter));

imgEye = conv2(imgY, eyeFilter, 'same');
imgEye = imgEye/max(imgEye(:));

imgnose = conv2(imgY, noseFilter, 'same');
imgnose = imgnose/max(imgnose(:));

imgmouth = conv2(imgY, mouthFilter, 'same');
imgmouth = imgmouth/max(imgmouth(:));

figure(2); 
imshow([imgEye,imgnose,imgmouth]);




num = 0;
target = zeros(num,2);   % 위치값 저장하는 변수
threshold = 0.1;
objsize = size(eyeFilter);
% 마킹을 위한 반경
radr = ceil(objsize(1)/2);
radc = ceil(objsize(2)/2);
while(num<2)
    [maxval, r, c] = max2d(imgEye); % 최대값 위치 r,c
    if maxval < threshold
        break;
    end
    num = num+1;

    target(num,1)=r;
    target(num,2)=c;

    % Erase
    rs = r-radr;
    re = r+radr;
    cs = c-radc;
    ce = c+radc;
    imgEye(rs:re, cs:ce) = 0;
  
end

color = [255, 0, 0];
imgB = imDrawBox(img, target,objsize,color);

figure(3); imshow(uint8(imgB));


