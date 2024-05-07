function [imgCross] = imDrawCross(img,center,size,color)
% center[r,c]
% size = n

r = center(1);
c = center(2);

img(r,c,1) = color(1);
img(r,c,2) = color(2);
img(r,c,3) = color(3);

for i=1:size
    img(r+i,c,1) = color(1);
    img(r-i,c,1) = color(1);
    img(r,c+i,1) = color(1);
    img(r,c-i,1) = color(1);

    img(r+i,c,2) = color(2);
    img(r-i,c,2) = color(2);
    img(r,c+i,2) = color(2);
    img(r,c-i,2) = color(2);

    img(r+i,c,3) = color(3);
    img(r-i,c,3) = color(3);
    img(r,c+i,3) = color(3);
    img(r,c-i,3) = color(3);
end

imgCross = img;

    
