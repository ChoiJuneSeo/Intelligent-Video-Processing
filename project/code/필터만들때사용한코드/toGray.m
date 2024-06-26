clear;
clc;

folder_path = 'images/answer'; 
eye_list = read_jpg_files(folder_path); 

for i = 1:numel(eye_list)
    current_file_path = eye_list{i};
    img = imread(current_file_path);
    
    if size(img, 3) == 3 %
        grayImage = rgb2gray(img);
    else
        grayImage = img;
    end   
    imwrite(grayImage, fullfile(folder_path, ['gray_', num2str(i), '.jpg']));
end
