function [img, filter] = convImgFilter(fname,folder_path,threshold,sigma)
% 이미지와 폴더 안의 필터들을 convolution해서 max값이 제일 큰 필터를 찾는 함수
% edge버전



img_list = read_jpg_files(folder_path);
image = imread(fname);
grayImg = rgb2gray(image);
edgeImg = edge(grayImg, 'Canny',threshold,sigma);
figure;
imshow(edgeImg);
max_value = -Inf;
max_image = [];

for i = 1:numel(img_list)
        current_file_path = img_list{i};
        filter = imread(current_file_path);
        filter = rgb2gray(filter);
        filter = double(filter);
        filter = preConv(filter);
       
        edgeImg = double(edgeImg);

        convImg = conv2(edgeImg, filter, 'same');

        current_max_value = max(convImg(:));

        if current_max_value > max_value
        max_value = current_max_value;
        max_image = convImg;
        max_filter = filter;
        end
end

filter = max_filter;
img = max_image;
img = img/max(img(:));
disp(max_value);






