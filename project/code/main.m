clear;
clc;

fname ="45_2.jpg";
img = imread(fname);


patt1 = "eye45.jpg";
patt2 = "nose45.jpg";
patt3 = "mouth45.jpg";



sigma = 2;
grayImg = rgb2gray(img);
edgeImg = edge(grayImg, 'Canny',0.1,1);


figure(1); imshow(img);
figure(2); imshow(edgeImg)



% 필터들
eyeFilter = imread(patt1);
noseFilter = imread(patt2);
mouthFilter = imread(patt3);

figure(4); imshow(uint8(eyeFilter));
figure(5); imshow(uint8(noseFilter));
figure(6); imshow(uint8(mouthFilter));

eyeFilter = double(rgb2gray(eyeFilter));
noseFilter = double(rgb2gray(noseFilter));
mouthFilter = double(rgb2gray(mouthFilter));
% 전처리
eyeFilter = preConv(eyeFilter);
noseFilter = preConv(noseFilter);
mouthFilter = preConv(mouthFilter);

% 컨볼루션
edgeImg = double(edgeImg);

imgEye = conv2(edgeImg, eyeFilter, 'same');
imgEye = imgEye/max(imgEye(:));

imgNose = conv2(edgeImg, noseFilter, 'same');
imgNose = imgNose/max(imgNose(:));

imgMouth = conv2(edgeImg, mouthFilter, 'same');
imgMouth = imgMouth/max(imgMouth(:));

figure(7); 
imshow([imgEye,imgNose,imgMouth]);


% 눈 그리기
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

figure(8); imshow(uint8(imgB));

% 코 그리기
num = 0;
target = zeros(num,2);   % 위치값 저장하는 변수
threshold = 0.1;
objsize = size(noseFilter);
% 마킹을 위한 반경
radr = ceil(objsize(1)/2);
radc = ceil(objsize(2)/2);
while(num<1)
    [maxval, r, c] = max2d(imgNose); % 최대값 위치 r,c
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
    imgNose(rs:re, cs:ce) = 0;
  
end
color = [0, 255, 0];
imgB = imDrawBox(imgB, target,objsize,color);

figure(9); imshow(uint8(imgB));

% 입 그리기
num = 0;
target = zeros(num,2);   % 위치값 저장하는 변수
threshold = 0.1;
objsize = size(mouthFilter);
% 마킹을 위한 반경
radr = ceil(objsize(1)/2);
radc = ceil(objsize(2)/2);
while(num<1)
    [maxval, r, c] = max2d(imgMouth); % 최대값 위치 r,c
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
    imgMouth(rs:re, cs:ce) = 0;
  
end
color = [0, 0, 255];
imgB = imDrawBox(imgB, target,objsize,color);

figure(10); imshow(uint8(imgB));
