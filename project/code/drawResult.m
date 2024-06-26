function [imgD] = drawResult(img,convImg,filter,color)
% max값 기준으로 box 그려주는 함수

objsize = size(filter);
[~, r, c] = max2d(convImg); 

imgD = imDrawBox(img, [r,c],objsize,color);
