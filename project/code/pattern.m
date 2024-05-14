% Lab 03 :
% Pattern recognition via convolution

clear;
clc;

fname ="p.jpg";
img = imread(fname);
figure(1); imshow(img);

imgY = (img(:,:,1) + img(:,:,2) + img(:,:,3))/3;
imgY = double(imgY);
obj = imgY(58:58+21, 108:108+21);
figure(2); imshow(obj);

% conv쓰기 위한 조작
patt = flipud(fliplr(obj));   % 상하 좌우 flip$
patt = patt/sum(patt(:));     % sum을 1로
patt = patt - mean(patt(:));  % 평균을 빼는게 좋은 경우가 많음

imgR = conv2(imgY, patt, 'same');
imgR = imgR/max(imgR(:));

figure(3); imshow(imgR);
figure(4); mesh(imgR);

num = 0;
rcpnt = zeros(num,2);   % 위치값 저장하는 변수
threshold = 0.6;
objsize = size(obj);
% 마킹을 위한 반경
radr = ceil(objsize(1)/2);
radc = ceil(objsize(2)/2);
while(num<1000)
    [maxval, r, c] = max2d(imgR); % 최대값 위치 r,c
    if maxval < threshold
        break;
    end
    num = num+1;

    rcpnt(num,1)=r;
    rcpnt(num,2)=c;

    % Erase
    rs = r-radr;
    re = r+radr;
    cs = c-radc;
    ce = c+radc;
    imgR(rs:re, cs:ce) = 0;
end

rad = radr;
color = [255, 0, 0];
imgC = DrawCross(img, rcpnt, rad, color);
figure(5); imshow(imgC);


function [maxval, r, c] = max2d(img)
%

[row, col] = size(img);

img = img';
vec = img(:);

[maxval, ind] = max(vec);

r = floor((ind-1)/col);
c = (ind-1) - r*col;

r = r+1;
c = c+1;
end