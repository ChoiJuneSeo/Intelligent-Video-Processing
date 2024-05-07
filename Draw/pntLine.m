function [point] = pntLine(lineInfo)
%
% lineinfo = [r1,c1,r2,c2]

r1 = lineInfo(1);
r2 = lineInfo(3);
c1 = lineInfo(2);
c2 = lineInfo(4);

len =  ceil(sqrt((r2-r1)^2 + (c2-c1)^2));

t = 0 : 1/len :1;

r = (r2-r1)*t + r1;
c = (c2-c1)*t + c1;

point = [r(:),c(:)];    % (:) column 백터로 변환



