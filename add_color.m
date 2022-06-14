%% add_color
% add all colors to the image with desired scaling
% Benjamin Green - Johns Hopkins 03.21.20201
%% -----------------------------------------------
function im2 = add_color(im, mycol, h, w)
%
% apply the color map
%
a = 300;
b = 2.5;
im2 = a * asinh(b * im) * mycol.all; % more simply im2 = im * mycol.all;
im2 = reshape(im2, h, w, 3);
%
end