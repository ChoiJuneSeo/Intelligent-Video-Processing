function [imgB] = CFAInterpolationB(cfa)
% 
% cfa RGGB pattern

[row, col] = size(cfa);
cfa = double(cfa);
imgB = zeros(row,col);

% RG -> even line
% GB -> odd line
% 0 0 0 0 0 0 0 0 
% 0 b 0 b 0 b 0 b
% 0 0 0 0 0 0 0 0 
% 0 b 0 b 0 b 0 b

for r=2:2:row-2
    for c=2:2:col-2
        imgB(r,c) = cfa(r,c);
        imgB(r,c+1) = (cfa(r,c)+cfa(r,c+2))/2;
        imgB(r+1,c) = (cfa(r,c)+cfa(r+2,c))/2;
        imgB(r+1,c+1) = (cfa(r,c)+cfa(r+2,c)+cfa(r,c+2)+cfa(r+2,c+2))/4;
    end
end

imgB = uint8(imgB);