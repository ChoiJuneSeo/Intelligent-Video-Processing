clear;
clc;

folder_path = 'images/ne13'; % 이미지 폴더 경로
eye_list = read_jpg_files(folder_path); % 이미지 폴더 내의 .jpg 파일 리스트 가져오기

for i = 1:numel(eye_list)
        
        current_file_path = eye_list{i};
        img = imread(current_file_path);
        img2 = imresize(img,1.2);
        imwrite(img2,[folder_path,'/resizing_',num2str(i),'.jpg']);
end
