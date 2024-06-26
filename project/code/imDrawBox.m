function imgBox = imDrawBox(img, center, boxSize, color)
    % img: 입력 이미지
    % center: 박스 중심 좌표
    % size: 박스 크기 [width, height]
    % color: 박스 색상 [R, G, B]
    

    imgBox = img;
    halfWidth = boxSize(1) / 2;
    halfHeight = boxSize(2) / 2;
    [num, ~] = size(center);

    for n = 1:num
        r = center(n,1);
        c = center(n,2);

        x1 = round(r - halfWidth);
        y1 = round(c - halfHeight);
        x2 = round(r + halfWidth);
        y2 = round(c + halfHeight);

        % 범위 문제 생기면 박스 대신 점 찍기
        if x1 < 0 || y1 < 0 || x2 < 0 || y2 < 0
            imgBox(r,c,1) = color(1);
            imgBox(r,c,2) = color(2);
            imgBox(r,c,3) = color(3);
            continue;
        end
        
        imgBox(x1:x2, y1, 1) = color(1);
        imgBox(x1:x2, y1, 2) = color(2);
        imgBox(x1:x2, y1, 3) = color(3);
    
        imgBox(x1:x2, y2, 1) = color(1);
        imgBox(x1:x2, y2, 2) = color(2);
        imgBox(x1:x2, y2, 3) = color(3);
    
        imgBox(x1,y1:y2, 1) = color(1);
        imgBox(x1,y1:y2, 2) = color(2);
        imgBox(x1,y1:y2, 3) = color(3);
    
        imgBox(x2,y1:y2, 1) = color(1);
        imgBox(x2,y1:y2, 2) = color(2);
        imgBox(x2,y1:y2, 3) = color(3);
    end
end


