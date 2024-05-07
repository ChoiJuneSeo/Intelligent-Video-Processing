function [imgC] = DrawCross(img, rcpnt, rad, color)
%
%

imgC = img;
[num, wid] = size(rcpnt);

for n = 1:num
    r = rcpnt(n,1);
    c = rcpnt(n,2);

    imgC(r-rad:r+rad, c, 1) = color(1);
    imgC(r, c-rad:c+rad, 1) = color(1);

    imgC(r-rad:r+rad, c, 2) = color(2);
    imgC(r, c-rad:c+rad, 2) = color(2);
    
    imgC(r-rad:r+rad, c, 3) = color(3);
    imgC(r, c-rad:c+rad, 3) = color(3);

end

end