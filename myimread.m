%% my_imread
% read in provided image
% Benjamin Green - Johns Hopkins 03.20.2021
%% -----------------------------------
function [im, h, w, l] = myimread(wd, folder, imname)
%
impath = [wd,'\',folder,'\inform_data\Component_Tiffs'];
full_image_name = fullfile(impath,imname);
%
imf = imfinfo(full_image_name);
if length(imf) <= 13
    l = 8;
else 
    l = 10; 
end
%
h = imf.Height;
w = imf.Width;
%
im = [];
for i2 = 1:l
    ima = imread(full_image_name,i2);
    imb = reshape(ima,[],1);
    im(:,i2) = imb./ max(imb);
end
%
end