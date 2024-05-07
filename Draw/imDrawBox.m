function [imgBox] = imDrawBox(img,leftTop,rightBottom,color)
% img[row,col,3]
% leftTop[r,c] rightBottom[r,c]
% color[R,G,B]

r1 = leftTop(1);
c1 = leftTop(2);
r2 = rightBottom(1);
c2 = rightBottom(2);

for i=r1:r2
    img(i,c1,1) =color(1);
    img(i,c1,2) =color(2);
    img(i,c1,3) =color(3);

    img(i,c2,1) = color(1);
    img(i,c2,2) = color(2);
    img(i,c2,3) = color(3);
end

for i=c1:c2
    img(r1,i,1) = color(1);
    img(r1,i,2) = color(2);
    img(r1,i,3) = color(3);

    img(r2,i,1) = color(1);
    img(r2,i,2) = color(2);
    img(r2,i,3) = color(3);
end

imgBox = img;

