%% foxp3cd8_add_color
% add in color for images
% matricies used to quickly change between different settings. dapi and
% component color are established separately then added together. 
% a1 and b1 indicate dapi coloring. 
% a2 and b2 indicate component coloring. 
% Parameters can be changed as needed. a values generally represent changes
% in brightness where b values generally represent changes in contrast
% (background to foreground shifts).
%% input
% im: vectorized image
% mycol: color vectors defined by foxp3cd8_colors()
% color_scale: which row to use for the tables below, typically increasing
% in brightness
% include_dapi: logical to include dapi (1) or not (0)
% color_count: which column to use for the colors - (2 for foxp3, 1 for cd8)
% dapi: which row to use for DAPI
%% -------------------------------------
function [im2] = foxp3cd8_add_color(...
    im, mycol, color_scale, include_dapi, color_count, dapi)
%
% dapi color options
%
a1 = [180 200 300];
b1 = [2.5 2.5 5];
%
% single color options
%
a2 = [180 150 200;
    275 275 200;
    220 275 200];
b2 = [2.5 2.5 2.5;
    3 3.25 2.5;
    2.5 3.25 3];
%{
a2 = [225 250 200;
    225 250 180;
    225 225 200];
b2 = [2 3 2.5;
    2.5 4 3;
    1.75 3.5 3];
%}
if color_count ==3 
    %
    mycol_ab = mycol.cd8;
    im2 = a2(color_scale, 3) * ...
        asinh(b2(color_scale, 3) * im) * mycol_ab;
    mycol_ab = mycol.foxp3;
    im3 = a2(color_scale, 2) * ...
        asinh(b2(color_scale, 2) * im) * mycol_ab;
    %
    im2 = im2 + im3;
else 
    if color_count == 1
        mycol_ab = mycol.cd8;
    else
        mycol_ab = mycol.foxp3;
    end
    %
    im2 = a2(color_scale, color_count) * ...
        asinh(b2(color_scale, color_count) * im) * mycol_ab;
    %
end
%
if include_dapi == 1
    im3 = a1(dapi) * asinh(b1(dapi) * im) * mycol.dapi;
    im2 = im3 + im2;
end
%
end
