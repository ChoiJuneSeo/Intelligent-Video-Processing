function [patt] = preConv(obj)

patt = flipud(fliplr(obj)); 
patt = patt/sum(patt(:));   
patt = patt - mean(patt(:));  