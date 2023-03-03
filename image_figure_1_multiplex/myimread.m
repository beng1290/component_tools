%% my_imread
% read in provided image
%% -----------------------------------
function [im] = myimread(wd, folder, xcoord, ycoord)
%
impath = [wd,'\',folder,'\inform_data\Component_Tiffs'];
imname = [folder,'_[',num2str(xcoord),',',...
    num2str(ycoord),']_component_data.tif'];
full_image_name = fullfile(impath,imname);
%
im = [];
for i2 = 1:8
    ima = imread(full_image_name,i2);
    imb = reshape(ima,[],1);
    im(:,i2) = imb./ max(imb);
end
%
end