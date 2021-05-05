%% show_tissue_regions
% show the full color image, then tumor overlay (red), stroma (green),
% blank(blue) in subsequent images (note blank is hard to see on the last
% image)
%% -----------------------------------------------------
function show_tissue_regions()
%
% image
%
wd = '\\BKI03\Lung_TMAs';
folder = 'TMA_1314';
imname = 'TMA_1314_Core[1,1,10]_[52191,21041]_component_data_w_seg.tif';
%
mycol = def_colors();     
[im, h, w] = myimread(wd, folder, imname);
%
% add color to the image 
%
imc = add_color(im, mycol, h, w);
%
figure()
imshow(uint8(imc)); shg
%
% get the different tissue layers and display those overtop
%
impath = [wd,'\',folder,'\inform_data\Component_Tiffs'];
full_image_name = fullfile(impath,imname);
%
imt = imread(full_image_name, 9);
imb = zeros(size(imc));
%
for i1 = 0:2
    %
    % get the layer of interest (0: AE1AE3; 1:Stroma; 2:Blank)
    %
    ii = imt == i1;
    imt2 = repmat(ii, 1, 1, 3);
    ind = find(imt2);
    %
    % create a solid color mask
    %
    ima = imb;
    ima(:,:,i1+1) = 255;
    %
    % combine images with alpha blend of a
    %
    a = .4;
    imc2 = imc;
    imc2(ind) = imc(ind) * (1-a) +  a .* ima(ind);
    figure()
    imshow(uint8(imc2)); shg
end
%
end