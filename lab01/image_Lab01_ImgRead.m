% image Lab 01 : image read

% image loading
fhead = 'lena';
fext = 'jpg';
filename = sprintf('%s.%s',fhead,fext);

img = imread(filename);

[row, col, dep] = size(img);

% image display
figure(1);
imshow(img);

imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);

figure(2);
imshow([imgR,imgG,imgB]);

imwrite([imgR,imgG,imgB],[filename 'RGB.png']);

% Draw a horizontal line on the image

color = [0,255,0]; %red

stpos = [100,100];
linelen = 50;

% img(stpos(1),stpos(2):stpos(2)+linelen-1,1) = color(1);    % R-plane 
% img(stpos(1),stpos(2):stpos(2)+linelen-1,2) = color(2);    % G-plane
% img(stpos(1),stpos(2):stpos(2)+linelen-1,3) = color(3);    % B-plane
% 
% img(stpos(1):stpos(1)+linelen-1,stpos(2),1) = color(1);
% img(stpos(1):stpos(1)+linelen-1,stpos(2),2) = color(2);
% img(stpos(1):stpos(1)+linelen-1,stpos(2),3) = color(3);

% Draw a box
color = [255,255,0];
pos = [100,100];
boxsize = [50,50];

img = DrawBox(img,pos,boxsize,color);

for n=1:5
    img = DrawBox(img,pos,boxsize+n*8,color);
end
figure(3);
imshow(img);

filenameout = sprintf('%s_box.%s',fhead,fext);
imwrite(img,filenameout);
