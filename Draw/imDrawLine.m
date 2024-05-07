function [imLine] = imDrawLine(img,p1,p2,color)
%
%
imLine = img;
size = round(sqrt((p2(1) - p1(1))^2 + (p2(2) - p1(2))^2));
for t = linspace(0,1,size)
    x = round((p2(1) - p1(1))*t + p1(1));
    y = round((p2(2) - p1(2))*t + p1(2));

    imLine(y,x,:) = color;
end
