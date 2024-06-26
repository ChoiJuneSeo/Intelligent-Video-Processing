% 이미지 불러오기
image = imread('face.jpg');

% 새로운 크기 지정
new_size = [531, 413]; % 새로운 크기를 [높이, 너비]로 지정

% 이미지 크기 조절
resized_image = imresize(image, new_size);

% 조절된 이미지 표시
figure(1);
imshow(resized_image);
imwrite(resized_image,'face22.jpg');