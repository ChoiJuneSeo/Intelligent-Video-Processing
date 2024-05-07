function imgCircle = imDrawCircle(img, center, radius, color)
    % img: 입력 이미지
    % center: 원의 중심 좌표 [x, y]
    % radius: 원의 반지름
    % color: 원의 색상

    % 입력 이미지 복사
    imgCircle = img;

    % 원 주위의 픽셀을 그리기
    for theta = linspace(0, 2*pi, 2*pi*radius)
        x = round(center(1) + radius * cos(theta));
        y = round(center(2) + radius * sin(theta));
        
        imgCircle(y, x, :) = color;
       
    end
end



