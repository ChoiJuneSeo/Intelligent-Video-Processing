function [img, filter] = convImgFilter2(fname,folder_path)
% 이미지와 폴더 안의 필터들을 convolution해서 max값이 제일 큰 필터를 찾는 함수

img_list = read_jpg_files(folder_path);
image = imread(fname);
grayImg = rgb2gray(image);
max_value = -Inf;
max_image = [];

for i = 1:numel(img_list)
        current_file_path = img_list{i};
        filter = imread(current_file_path);
        filter = rgb2gray(filter);
        filter = double(filter);
        filter = preConv(filter);
       
        grayImg = double(grayImg);

        convImg = conv2(grayImg, filter, 'same');

        current_max_value = max(convImg(:));

        if current_max_value > max_value
        max_value = current_max_value;
        max_image = convImg;  
        end
end

img = max_image;
img = img/max(img(:));
disp(max_value);






