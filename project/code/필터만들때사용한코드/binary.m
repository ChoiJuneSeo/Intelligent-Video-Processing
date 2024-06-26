

clear;
clc;

folder_path = 'images/ne'; % 이미지 폴더 경로
eye_list = read_jpg_files(folder_path); % 이미지 폴더 내의 .jpg 파일 리스트 가져오기
threshold = 80;


for i = 1:numel(eye_list)        
        current_file_path = eye_list{i};
        img = imread(current_file_path);
        binary_img = img > threshold;
        binary_img = binary_img * 255;
        img = uint8(binary_img);
        imwrite(img,[folder_path,'/ne',num2str(i),'.jpg']);
end