%% add_color
% add all colors to the image with desired scaling
%% -----------------------------------------------
function im2 = add_color(im, mycol, color_scale, vals, vals2)
%
% apply the color map
%
a = 180;
b = 2;
im2 = a * asinh(b * im) * mycol.notumorfoxp3;
im2 = reshape(im2,1004,1344,3);
%
a = 250;
b = 2.5;
im3 = a * asinh(b * im) * mycol.tumor;
im3 = reshape(im3,1004,1344,3);
%
im2 = im2 + im3;
%
a3 = 180;
b3 = 2;
im4 = a3 * asinh(b3 * im) * mycol.foxp3;
im4 = reshape(im4,1004,1344,3);
%
im2 = im2 + im4;
%
end
