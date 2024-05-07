function [imgout] = imDrawPoint(img,pnt,color) 
% 이미지를 받아서 그림을 그려서 출력해주는 함수

% img[row,col,color]

r = pnt(1);
c = pnt(2);
R = color(1);
G = color(2);
B = color(3);

img(r,c,1) = R;
img(r,c,2) = G;
img(r,c,3) = B;

imgout =img;

end