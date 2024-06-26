clear;
clc;

folder_path = 'images/answer'; % 이미지 폴더 경로
eye_list = read_jpg_files(folder_path); % 이미지 폴더 내의 .jpg 파일 리스트 가져오기

for i = 1:numel(eye_list)
        
        current_file_path = eye_list{i};
        img = imread(current_file_path);
        grayImage = rgb2gray(img);
        edge_img = edge(grayImage, 'Canny',0.15,3);
        imwrite(edge_img,['images/answer/15_3_',num2str(i),'.jpg']);
end

% 사진 크기는 핸드폰 3000 4000 => 컴퓨터로 옮기는 과정에서 1050 * 1400




