%% add_color
% add all colors to the image with desired scaling
%% -----------------------------------------------
function im2 = add_color(im, mycol, color_scale, vals, vals2)
%
% apply the color map
%
a = 180;
b = 2;
im2 = a * asinh(b * im) * mycol.notumor;
im2 = reshape(im2,1004,1344,3);
%
a = 250;
b = 2.5;
im3 = a * asinh(b * im) * mycol.tumor;
im3 = reshape(im3,1004,1344,3);
%
im2 = im2 + im3;

end