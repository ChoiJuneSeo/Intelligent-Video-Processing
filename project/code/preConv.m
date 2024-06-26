function [patt] = preConv(obj)
% conv 전처리 함수

patt = flipud(fliplr(obj)); 
patt = patt/sum(patt(:));   
patt = patt - mean(patt(:));  