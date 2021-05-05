%% my_imread
% read in provided image
% Benjamin Green - Johns Hopkins 03.20.2021
%% -----------------------------------
function [im, h, w] = myimread(wd, folder, imname)
%
impath = [wd,'\',folder,'\inform_data\Component_Tiffs'];
full_image_name = fullfile(impath,imname);
%
imf = imfinfo(full_image_name);
h = imf.Height;
w = imf.Width;
%
im = [];
for i2 = 1:8
    ima = imread(full_image_name,i2);
    imb = reshape(ima,[],1);
    im(:,i2) = imb./ max(imb);
end
%
end