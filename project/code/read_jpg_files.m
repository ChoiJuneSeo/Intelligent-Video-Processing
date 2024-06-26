function jpg_files_list = read_jpg_files(folder_path)
    % 폴더에서 모든 .jpg 파일 목록 가져오기
    files = dir(fullfile(folder_path, '*.jpg')); % .jpg 확장자를 가진 파일만 가져오도록 지정

    % 파일 목록을 저장할 리스트 초기화
    jpg_files_list = cell(1, numel(files));

    % 각 .jpg 파일에 대해 파일 경로를 리스트에 저장
    for i = 1:numel(files)
        jpg_files_list{i} = fullfile(folder_path, files(i).name);
    end
end
