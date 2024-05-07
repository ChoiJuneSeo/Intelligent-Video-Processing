function [imgout] = imDrawPoints(img,pnt,color) 
% 여러 점을 받아서 그림을 그려서 출력해주는 함수
% pnt = [r1,c1; r2,c2; ... ; rn,cn]
% img = [row,col,color]
% color = [R,G,B]

[row,col] = size(pnt);
num = row;
for n=1:num
    r = round(pnt(n,1));
    c = round(pnt(n,2));
    
    img(r,c,1) = color(1);
    img(r,c,2) = color(2);
    img(r,c,3) = color(3);
end

imgout =img;

end