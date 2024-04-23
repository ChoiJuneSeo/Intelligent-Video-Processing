function [imgD] = SamplingDown(img,pitch,phpit)
% [imgD] = SamplingDown(img,pitch,phase)
% e.g. pitch = [2,3]; phpit = [0,0];
% image down sampling

imgD = img(phpit(1)+1:pitch(1):end,phpit(2)+1:pitch(2):end,:);
