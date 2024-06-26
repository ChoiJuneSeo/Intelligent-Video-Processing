close all;
% MATLAB에서 얼굴 및 눈, 코, 입 탐지 예제 코드

% 필요한 패키지를 로드합니다.
visionToolboxIsAvailable = license('test', 'image_toolbox') && license('test', 'video_and_image_blockset');
if ~visionToolboxIsAvailable
    error('Computer Vision Toolbox가 필요합니다.');
end

% 얼굴 탐지기 객체를 생성합니다.
faceDetector = vision.CascadeObjectDetector();

% 눈 탐지기 객체를 생성합니다.
eyeDetector = vision.CascadeObjectDetector('EyePairBig');

% 코 탐지기 객체를 생성합니다.
noseDetector = vision.CascadeObjectDetector('Nose');


% 입 탐지기 객체를 생성합니다.
mouthDetector = vision.CascadeObjectDetector('Mouth');

% 입력 이미지 읽기
img = imread('images/test/front_test.jpg');

% 얼굴 탐지
bboxFace = step(faceDetector, img);

% 결과 이미지를 표시하기 위해 복사합니다.
imgWithAnnotations = img;

% 얼굴 경계 상자 그리기
for i = 1:size(bboxFace, 1)
    imgWithAnnotations = insertObjectAnnotation(imgWithAnnotations, 'rectangle', bboxFace(i,:), 'Face');
end

% 얼굴 경계 상자를 바탕으로 각 얼굴의 세부 특징 탐지
for i = 1:size(bboxFace, 1)
    % 얼굴 영역을 잘라냅니다.
    faceImg = imcrop(img, bboxFace(i, :));

    % 눈 탐지
    bboxEyes = step(eyeDetector, faceImg);
    for j = 1:size(bboxEyes, 1)
        bboxEyes(j, 1:2) = bboxEyes(j, 1:2) + bboxFace(i, 1:2); % 원본 이미지 좌표로 변환
        imgWithAnnotations = insertObjectAnnotation(imgWithAnnotations, 'rectangle', bboxEyes(j, :), 'Eyes');
    end

    % 코 탐지
    bboxNose = step(noseDetector, faceImg);
    for j = 1:size(bboxNose, 1)
        bboxNose(j, 1:2) = bboxNose(j, 1:2) + bboxFace(i, 1:2); % 원본 이미지 좌표로 변환
        imgWithAnnotations = insertObjectAnnotation(imgWithAnnotations, 'rectangle', bboxNose(j, :), 'Nose');
    end

    % 입 탐지
    bboxMouth = step(mouthDetector, faceImg);
    for j = 1:size(bboxMouth, 1)
        bboxMouth(j, 1:2) = bboxMouth(j, 1:2) + bboxFace(i, 1:2); % 원본 이미지 좌표로 변환
        imgWithAnnotations = insertObjectAnnotation(imgWithAnnotations, 'rectangle', bboxMouth(j, :), 'Mouth');
    end
end

% 결과 이미지 표시
figure; imshow(imgWithAnnotations); title('Detected faces, eyes, nose, and mouth');
imwrite(imgWithAnnotations,'2.png');
